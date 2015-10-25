# GettingCleaningDataProject
This repository contains the Samsung Galaxy S accelerometer data set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), cleaned according to the following guidelines:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Upload data set as a txt file created with write.table() using row.name=FALSE.


## Variable Names
The names of the variables were changed according to the following rules: 

* All lower case when possible
* Descriptive
* Not duplicated
* Not have underscores, dots or whitespaces

### Code
Script *run_analysis.R* performs the operations described in steps 1--6 above. Note that the "-" in the variable names was left in for readability with spreadsheet software, but read.table replaces them by "."  To view the file with LibreOffice, OpenOffice or Excel, open the file with the *Separated by: Space* option (or its Excel equivalent). To view the file with R use 'read.table' with header = TRUE option; to replace "." in the variable names use  ''' dataset_name <- gsub("\\.","",names(dataset_name))'''
 
