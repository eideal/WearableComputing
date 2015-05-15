library(data.table)
library(plyr)
library(dplyr)

fileUrl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

## Create the data directory and download + unzip the zip file
if(!file.exists('./data')){
        dir.create('./data')
}
if(!file.exists('./data/UCI HAR Dataset')){
        download.file(fileUrl, destfile='./data/data.zip', method='curl')
        unzip('./data/data.zip', exdir='./data/')
}

## Read .txt files into data tables
setwd('./data/UCI HAR Dataset/')
activity_labels <- read.table('activity_labels.txt')
features <- read.table('features.txt')

setwd('./test/')
subject_test <- read.table('subject_test.txt')
X_test <- read.table('X_test.txt')
y_test <- read.table('y_test.txt')

setwd('../train/')
subject_train <- read.table('subject_train.txt')
X_train <- read.table('X_train.txt')
y_train <- read.table('y_train.txt')

## Replace data in y_test and y_train with descriptive activity_labels
colnames(y_test) <- 'activity'
colnames(y_train) <- 'activity'
y_test <- mutate(y_test, activity = activity_labels[activity,2])
y_train <- mutate(y_train, activity = activity_labels[activity,2])

## Set column names for X_test and X_train with descriptions from 'features'
colnames(X_test) <- features[,2]
colnames(X_train) <- features[,2]

## Set column names for subject_test and subject_train
colnames(subject_test) <- 'subject'
colnames(subject_train) <- 'subject'

## Merge to make the test and train data frame
mergedTest <- cbind(subject_test, y_test, X_test)
mergedTrain <- cbind(subject_train, y_train, X_train)

## Merge the test and train data frames
mergedAll <- rbind(mergedTest, mergedTrain)

## Filter for columns containing 'mean' or 'std' in column name
means <- grep('mean()\\b', names(mergedAll))
std <- grep('std()\\b', names(mergedAll))
cols_to_select <- c(1,2,means,std)
mergedFinal <- mergedAll[ ,cols_to_select]

## Tidy data set -> summarize by subject and activity and average all other columns
mergedTidy <- ddply(mergedFinal, .(subject, activity), numcolwise(mean, na.rm=TRUE))

## Write out the tidy data set to Tidy.txt
setwd("../../../")
write.table(mergedTidy, file = 'Tidy.txt', row.names=FALSE)
