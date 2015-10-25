# Code Book for Cleaning Samsung Galaxy S Accelerometer Data Set
## Description of Data Set
This data set is a tidy version of the Samsung Galaxy S accelerometer measurement set(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). A complete desription of the original data set can be found at http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names.

The original data set consists of measurements collected from 30 volunteers, divided in a training set (70%) and a test set (30%). Each subject performed a series of six activities; the variables measured represented 3-axial time domain signals from the accelerometer and gyroscope 3-axial (tAcc-XYZ and tGyro-XYZ). These measurements were used to calculate the body linear acceleration and angular velocity to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also, the magnitudes of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Frequency domain signals were obtained using the Fast Fourier Transform (FFT): fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. *Note that 't' indicates time-domain signals and 'f' indicate frequency-domain signals. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

```tBodyAcc-XYZ,
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

## Transformations

## Data Dictionary
subject: subject id

activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

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
