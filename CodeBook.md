---
title: "CodeBook"
output: github_document
---

This code book describes the transformations and variables created during the cleaning of the raw data "Human Activity Recognition Using Smartphones Dataset Version 1.0" in the R script run_analysis that generates the output file: tidy_dataset.txt.  

The input files for the run_analysis.R script are the training and test datasets and the purposes of this script are:

1. to merge the training and the test sets to create one data set.
2. to extract only the measurements on the mean and standard deviation for each measurement. 
3. to use descriptive activity names to name the activities in the data set
4. to appropriately label the data set with descriptive variable names. 
5. to generate an independent tidy data set with the average of each variable for each activity and each subject.


The transformations and variables will be hereafter described according to their steps in the run_analysis.R script.


*Step 3*. Load the training datasets using data.table function in separated files according to their contents:

train_sub: training dataset for the subjects (people that participated in the experiments) 

train_data: training dataset for the 561 measurements performed in the experiment

train_label: training dataset for the activity (walking, walking upstairs, walking downstairs, sitting, standing and laying) 
performed by each person. This variable is represented numeric. 



*Step 4*. The same definitions described in the Step 3, but for the test dataset. 



*Step 5*. To merge the training and the test sets to create one data set



merged_set: dataset on the 561 measurements performed for the training and test 

merged_sub: dataset on the subjects that participated in the training and test. The column name is renamed to "Subject" 

merged_label: dataset on the activity performed by the subjects in the training and test. The column name is renamed to "Activity_number"

The dataset in the measurements, activities and subjects for training and test are further merged resulting in the file merged_set



*Step 6*. load the features and its estimated variables names 

features: dataset on the features and its estimated variables. In total, 561 variables were calculated. The column names of the
dataframe are further renamed to "number" and "variable"

variables: a vector containing only the descriptive name of the 561 variables 



*Step 7*. appropriately label the dataset with descriptive variable names 

the column names of the merged_set (in total 561) are renamed to the names in the variable vector



*Step 8*. extract only the measurements on the mean and standard deviation for each measurement 

mean_std: identifies the rows of the features dataframe in which the column "variable" has the strings mean or std. The //
is used to desconsider the columns containing the MeanFreq() string

features_to_remove: subset of the rows for which columns were not listed in the mean_std vector (i.e. are not mean nor standard deviation variables)

features_to_remove is further converted to a vector with only the descriptive name of the variables

data_mean_std: subset of the merged_set dataframe without the variables that were not listed in the mean_std vector (i.e. 
merged_set with only mean and standard deviation measurements -- 66 columns)



*Step 9*. use descriptive activity names to name the activities in the data set

activities: dataframe with the six activities performed by the subjects and its respective number (1 to 6) 

the column names of the activities dataframe are renamed to "Activity_number" and "Description"

data_mean_std is further merged to activities dataframe and one column with the descriptive activities (ex. walking) is added.
The column with the activity number is deleted. The column named "Description" is renamed to "Activity".



*Step 10*. from the dataset on mean and stardard deviation, create a second and independent tidy data set with the average of 
each variable for each activity and each subject

final_data: a dataframe with 180 rows and 68 columns containing the average of each of the 66 measurements grouped by the activity and the subject



*Step 11*. export the data in a text format 
  
the final_data is exported in a text format



