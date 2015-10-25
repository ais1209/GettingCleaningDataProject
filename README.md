# GettingCleaningDataProject
This repository contains data extracted from the Samsung Galaxy S accelerometer data set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), cleaned according to the following guidelines:

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
* Not have underscores, dots or white spaces

See *CodeBook.md* for details.

### Code
Script *run_analysis.R* performs the operations described in steps 1--6 above. The input is the raw accelerometer data set and the output is a text file with the tidy data set. Once the raw data at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is downloaded and unzipped (which creates an additional directory), run the script from the directory where you have downloaded the zip file. No parameters are needed.

The Transformations section in the codebook contains more detailed explanations of the steps performed in the analysis. 

Note that the "-" in the tidy set variable names was left in for readability with spreadsheet software, but when loading the text file with `read.table`, it replaces "-" by "."  To view the file with LibreOffice, OpenOffice or Excel, open the file with the *Separated by: Space* option (or its Excel equivalent). To view the file with R, use `read.table` with the `header = TRUE` option; to replace "." in the variable names use  ``` dataset_name <- gsub("\\.","",names(dataset_name))```
