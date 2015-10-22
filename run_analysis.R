#file <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "Dataset.zip")
# system("unzip Dataset.zip")
#list.files(".")
library(data.table)
train <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", na.strings = "NA")
test <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", na.strings = "NA")

# Check for NA's
sumNAs <- sum(is.na(train)) + sum(is.na(test))
sumNAs

# Task 1
# Merge datasets: train (7352 x 561) and test (2947 x 561). Resulting table should be 10299 by 561, 
# each row is one set of measurements.
allData <- rbind(train,test, deparse.level = 0)


# Task 2
# A. Select features that contain mean and std, and find their row ID.
varnames <- read.csv("UCI HAR Dataset/features.txt",sep="",header=FALSE)
DT <- data.table(id=1:561, Name=varnames$V2)
allMeanStd <- DT[Name %like% "mean" | Name %like% "std"]
#selectID <- sort(c(allMean$id,allStd$id))

# B. Select only the columns corresponding to features (variables) that contain either mean or 
# std in their name
myData <- allData[,allMeanStd$id]

# Task 4: Rename the columns in the subset selected in Task 2.
for (ii in 1:ncol(myData)) { 
    names(myData)[ii] <- toString(allMeanStd$Name[ii])
}

# Task 3: Rename the rows (i.e, assign activity name to row id)
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE)
yTrain <- read.csv("UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE)
yTest <- read.csv("UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE)
activity <- rbind(yTrain,yTest,deparse.level=0)

# Insert a column with activity names corresponding to each row in myData.
for (ii in 1:nrow(activity)){ # same no of rows as in myData
    loc <- activity$V1[ii]
    activity$Name[ii] <- toString(activityLabels$V2[loc])
    myData$Activity[ii] <- toString(activity$Name[ii])
}

# Move the Activity column to position 1 in the data frame
myData <- myData[c(ncol(myData),1:ncol(myData)-1)]

#Part 5
# Add the Subject ID to the data set
library(reshape2)
library(plyr)
library(dplyr)
subjectTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE)
subjectTest <- read.csv("UCI HAR Dataset/test/subject_test.txt",sep="",header=FALSE)
subjectID <- rbind(subjectTrain,subjectTest,deparse.level=0)

for (ii in 1:nrow(subjectID)){ # same no of rows as in myData
    myData$SubjectID[ii] <- subjectID$V1[ii]
}

# Move the subjectID column to position 1 in the data frame
myData <- myData[c(ncol(myData),1:ncol(myData)-1)]

# Select subset with means for each activity for each subject.
finalData <- ddply(myData,.(SubjectID, Activity),numcolwise(mean,na.rm = TRUE))
write.table(finalData,"FinalDataSet.txt",row.names = FALSE)
