# Code Book for Cleaning Samsung Galaxy S Accelerometer Data Set
## Description of the Data Set
This data set is a tidy version of the Samsung Galaxy S accelerometer measurement set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). A complete desription of the original data set can be found at http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names.

The original data set consists of measurements collected from 30 volunteers, divided in a training set (70%) and a test set (30%). Each subject performed a series of six activities; the variables measured represented 3-axial time domain signals from the accelerometer and gyroscope (tAcc-XYZ and tGyro-XYZ). These measurements were used to calculate the body linear acceleration and angular velocity to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). The magnitudes of these three-dimensional signals were calculated using the Euclidean norm: tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag. Frequency domain signals were obtained using the Fast Fourier Transform (FFT): fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. Note that 't' indicates time-domain signals, 'f' indicates frequency-domain signals, and '-XYZ' denotes 3-axial signals in the X, Y and Z directions.

These signals were used to estimate variables of the feature vector for each pattern:  

```
tBodyAcc-XYZ,
tGravityAcc-XYZ,
tBodyAccJerk-XYZ,
tBodyGyro-XYZ,
tBodyGyroJerk-XYZ,
tBodyAccMag,
tGravityAccMag,
tBodyAccJerkMag,
tBodyGyroMag,
tBodyGyroJerkMag,
fBodyAcc-XYZ,
fBodyAccJerk-XYZ,
fBodyGyro-XYZ,
fBodyAccMag,
fBodyAccJerkMag,
fBodyGyroMag,
fBodyGyroJerkMag.
```

The set of variables that were estimated from these signals are: 
```
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
```
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
```
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
```
The raw data set contains 561 variables; there is no information related to units. The tidy data set contains 81 variables, which represent the average of each measurement of mean and standard deviation for each activity and each subject. There are 180 rows, corresponding to 30 subjects each performing 6 activities.

## Transformations
The following operations were performed on the original data set:

1. The *train* and *test* data sets were merged by rows, with the observations from *train* occupying the first 7352 rows and the ones from *test*, the remaining 2947. The resulting data set consisted of 10299 rows by 561 columns.

2. The features (columns) containing the mean and standard deviation of the measurements were extracted by comparing column numbers in the merged data set with row numbers in the *feature.txt* file, which contains variable names. In a nutshell, row numbers corresponding to variables containing *mean* or *std* in the feature file were obtained; the script then proceeded to extract the columns from the merged set at step 1 which had the same identifying number. Note that the number of rows in the feature file corresponds to the number of columns in the merged data set. The resulting subset contained 10299 rows by 79 columns.

3. The columns in the subset at step 2 were labeled according to the information in the *features.txt* file, which contains an ordered  list of all the variable names. 

4. Variable `activity` was created, which assigned a name to each row according to *activity_labels.txt*, *y_train.txt*, and *y_test.txt* (the latter two were merged). The *y_.txt* files list the activity identifiers corresponding to the measurements in X_train.txt and X_test.txt as numbers. In the resulting data set, which has 80 columns, each row corresponds to a particular activity: LAYING, SITTING,STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS. 

5. The subject identification (a number from 1 to 30) was added as variable `subject`; data was obtained from the *subject_train.txt* and *subject_test.txt* files. The resulting data set had 81 columns.

6. Some column manipulation was performed to move the `subject` and `activity` columns to the first and second positions.

7. A new subset was created from the data set at step 6, by applying `ddply` to calculate the mean values of all the numeric variables for each activity and subject. The resulting data set had 180 rows and 81 columns. Since there were 30 subjects, each performing 6 activities, 180 = 30 x 6 is the correct number of rows.

8. Variable names were cleaned up: names were changed to lower case and the non-character "()" was removed to comply with the rules for naming variables in a tidy data set. The "-" was left in for readability; names such as `tbodygyrojerkmagmean` may be difficult to comprehend.

9. The tidy data set was checked for presence of duplicate variables.

10. The data set was saved to a text file. The user is provided with instructions on how to read the data set with either R or a spreadsheet software.
 

## Data Dictionary
Except for `subject` (1 to 30), which is an integer, and `activity` (LAYING, SITTING,STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS), which is a factor, all the other variables are numeric, and represent averages of the measurements of the mean and standard deviations for each type of activity and subject. 

```
subject
activity 
tbodyacc-mean-x
tbodyacc-mean-y
tbodyacc-mean-z
tbodyacc-std-x
tbodyacc-std-y
tbodyacc-std-z
tgravityacc-mean-x
tgravityacc-mean-y
tgravityacc-mean-z
tgravityacc-std-x
tgravityacc-std-y
tgravityacc-std-z
tbodyaccjerk-mean-x
tbodyaccjerk-mean-y
tbodyaccjerk-mean-z
tbodyaccjerk-std-x
tbodyaccjerk-std-y
tbodyaccjerk-std-z
tbodygyro-mean-x
tbodygyro-mean-y
tbodygyro-mean-z
tbodygyro-std-x
tbodygyro-std-y
tbodygyro-std-z
tbodygyrojerk-mean-x
tbodygyrojerk-mean-y
tbodygyrojerk-mean-z
tbodygyrojerk-std-x
tbodygyrojerk-std-y
tbodygyrojerk-std-z
tbodyaccmag-mean
tbodyaccmag-std
tgravityaccmag-mean
tgravityaccmag-std
tbodyaccjerkmag-mean
tbodyaccjerkmag-std
tbodygyromag-mean
tbodygyromag-std
tbodygyrojerkmag-mean
tbodygyrojerkmag-std
fbodyacc-mean-x
fbodyacc-mean-y
fbodyacc-mean-z
fbodyacc-std-x
fbodyacc-std-y
fbodyacc-std-z
fbodyacc-meanfreq-x
fbodyacc-meanfreq-y
fbodyacc-meanfreq-z
fbodyaccjerk-mean-x
fbodyaccjerk-mean-y
fbodyaccjerk-mean-z
fbodyaccjerk-std-x
fbodyaccjerk-std-y
fbodyaccjerk-std-z
fbodyaccjerk-meanfreq-x
fbodyaccjerk-meanfreq-y
fbodyaccjerk-meanfreq-z
fbodygyro-mean-x
fbodygyro-mean-y
fbodygyro-mean-z
fbodygyro-std-x
fbodygyro-std-y
fbodygyro-std-z
fbodygyro-meanfreq-x
fbodygyro-meanfreq-y
fbodygyro-meanfreq-z
fbodyaccmag-mean
fbodyaccmag-std
fbodyaccmag-meanfreq
fbodybodyaccjerkmag-mean
fbodybodyaccjerkmag-std
fbodybodyaccjerkmag-meanfreq
fbodybodygyromag-mean
fbodybodygyromag-std
fbodybodygyromag-meanfreq
fbodybodygyrojerkmag-mean
fbodybodygyrojerkmag-std
fbodybodygyrojerkmag-meanfreq
```
## Acknowledgements
David Hood provides very useful information regarding the project here: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
