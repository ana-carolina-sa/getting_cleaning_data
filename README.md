This repo contains files used for cleaning dataset from the "Human Activity Recognition Using Smartphones Dataset
Version 1.0" (see further information on the dataset bellow) and its respective output tidy dataset required 
for completion of the course "Getting and cleaning data" on coursera.


This repo contains the following files:

- a R script (run_analysis.R) containing the pre-processing steps to clean up data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0".
- a tidy dataset (tidy_dataset.txt) output of the run_analysis.R containing the average for 66 measurements grouped by the activity performed (walking, walking upstairs, walking downstairs, sitting, standing and laying) and the subject (in total 30 people).
- a code book describing the variables and the transformations performed to clean up the raw dataset.
- a README file describing the existent files in the repo and how they relate to each other.


The dataset used for the cleaning steps is available at:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

These data contain results from experiments carried out with a group of 30 volunteers aged between 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were calculated. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

In the output file (tidy_dataset.txt) from the cleaning steps, the average of each of the 66 measurements was calculated 
from the merged training and test sets. 


