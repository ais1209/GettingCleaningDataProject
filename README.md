# GettingCleaningDataProject
This repository contains the Samsung Galaxy S accelerometer data set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), cleaned according to the following guidelines:
 

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Data set uploaded as a txt file created with write.table() using row.name=FALSE.


## Variable Names
The names of the variables were changed according to the following rules: 
    * All lower case when possible
    * Descriptive
    * Not duplicated
    * Not have underscores, dots or whitespaces

Note: I have left the "-" in the variable names for readability with spreadsheet software, but read.table replaces them by "." Please see the downloading instructions for further details.
 
