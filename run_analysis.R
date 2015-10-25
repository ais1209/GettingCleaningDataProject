#file <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "Dataset.zip")
# system("unzip Dataset.zip")
#list.files(".")

library(data.table)
library(reshape2)
library(plyr)
library(dplyr)

train <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", na.strings = "NA")
test <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", na.strings = "NA")

# Check for NA's
sumNAs <- sum(is.na(train)) + sum(is.na(test))

# ---------------------------------- Task 1 ------------------------------------------
# Merge datasets: train (7352 x 561) and test (2947 x 561). Resulting table should be 
# 10299 by 561, each row is one set of measurements.
allData <- rbind(train,test, deparse.level = 0)

# ---------------------------------- Task 2 ------------------------------------------
# Select features that contain mean and std, and find their row ID.
varnames <- read.csv("UCI HAR Dataset/features.txt",sep="",header=FALSE)
DT <- data.table(id=1:561, Name=varnames$V2)
allMeanStd <- DT[Name %like% "mean" | Name %like% "std"]

# Select only the columns corresponding to features (variables) that contain either mean 
# or std in their name
myData <- allData[,allMeanStd$id]

# ----------------------------------- Task 4 -----------------------------------------
# Rename the columns in the subset selected in Task 2.
for (ii in 1:ncol(myData)) { 
    names(myData)[ii] <- tolower(toString(allMeanStd$Name[ii]))
}

# ----------------------------------- Task 3 ----------------------------------------- 
# Rename the rows (i.e, assign activity name to row id)
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE)
yTrain <- read.csv("UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE)
yTest <- read.csv("UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE)
activity <- rbind(yTrain,yTest,deparse.level=0)

# Insert a column with activity names corresponding to each row in myData.
for (ii in 1:nrow(activity)){ # same no of rows as in myData
    loc <- activity$V1[ii]
    activity$Name[ii] <- toString(activityLabels$V2[loc])
    myData$activity[ii] <- toString(activity$Name[ii])
}

# Move the Activity column to position 1 in the data frame
myData <- myData[c(ncol(myData),1:ncol(myData)-1)]

# ----------------------------------- Task 5 -----------------------------------------
# Add the Subject ID to the data set
subjectTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE)
subjectTest <- read.csv("UCI HAR Dataset/test/subject_test.txt",sep="",header=FALSE)
subject <- rbind(subjectTrain,subjectTest,deparse.level=0)

for (ii in 1:nrow(subject)){ # same no of rows as in myData
    myData$subject[ii] <- subject$V1[ii]
}

# Move the subjectID column to position 1 in the data frame
myData <- myData[c(ncol(myData),1:ncol(myData)-1)]

# Select subset with means for each activity for each subject and clean up variable names.
finalData <- ddply(myData,.(subject, activity),numcolwise(mean,na.rm = TRUE))
names(finalData) <- tolower(gsub("\\(\\)","",names(finalData)))
# To remove the "-" use gsub("\\-","",names(finalData))

# Finally, check for duplicates (there shouldn't be any, but ...)
dups=which(duplicated(finalData))

# Write the data set to a text file.
write.table(finalData,"FinalDataSet.txt",row.names = FALSE)

# Note: read.table will convert "-" to ".". To read remove the ".":
# x <- read.table("FinalDataSet.txt", header = TRUE)
# names(x) <- gsub("\\.","",names(x))
