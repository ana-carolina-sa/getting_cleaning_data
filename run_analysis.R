### Getting and cleaning data: assignment 4 ###


## Step 1. required packages

library(plyr)
library(data.table)
library(tidyverse)


## Step 2. set the directory to the folder named "getdata_projectfiles_UCI HAR Dataset"
## this folder contains all the files required for the following cleaning steps


## Step 3. load all files belonging to the training dataset

train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE) 

train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")   

train_label <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)



## Step 4. load all files belonging to the test dataset

test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")

test_label <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)



## Step 5. merge the training and the test sets to create one data set

merged_set <- rbind(train_data, test_data)

merged_sub <- rbind(train_sub, test_sub)
colnames(merged_sub) <- "Subject"

merged_label <- rbind(train_label, test_label)
colnames(merged_label) <- "Activity_number"


merged_set <- cbind(merged_set, merged_sub)

merged_set <- cbind(merged_set, merged_label) ## resulting dataset


 
## Step 6. load the features and its estimated variables names 

features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

colnames(features) <- c("number", "variable")

variables <- features[, 2]



## Step 7. appropriately label the dataset with descriptive variable names 

colnames(merged_set)[1:561] <- variables



## Step 8. extract only the measurements on the mean and standard deviation for each measurement 
## not considering the MeanFreq() 

mean_std <- grep("mean\\()|std\\()", features$variable)

features_to_remove <- features[!(rownames(features) %in% mean_std),]

features_to_remove <- features_to_remove$variable

setDT(merged_set)

data_mean_std <- merged_set[, !features_to_remove, with = FALSE]



## Step 9. use descriptive activity names to name the activities in the data set

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

colnames(activities) <- c("Activity_number", "Description")

data_mean_std <- merge(data_mean_std, activities, by = "Activity_number")

data_mean_std$Activity_number <- NULL

colnames(data_mean_std)[colnames(data_mean_std) == "Description"] <- "Activity"



## Step 10. from the dataset on mean and stardard deviation, create a second and independent tidy data set with the average of 
## each variable for each activity and each subject

final_data <- data_mean_std %>% group_by(Subject, Activity) %>% summarise(across(c(1:66), ~ mean(.x, na.rm = TRUE)))



## Step 11. export the data in a text format 
  
write.table(final_data, "Tidy_dataset.txt", row.name = FALSE)  









