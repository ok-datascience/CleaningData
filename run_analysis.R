library(data.table)
library(dplyr)

# load additional code to perform variable names clean up
source('clean_variable_names.R')

# will check to ensure required directory with raw data exists in working directory
if( !file.exists('UCI HAR Dataset')){
  stop("Invalid script working environment. This script requires 'UCI HAR Dataset' directory in the working directory.")
}
 
# change work directory to directory containing raw data
setwd('UCI HAR Dataset')

# load raw data into memory
train_set <- cbind(read.table('./train/X_train.txt'), 
                   read.table('./train/y_train.txt'),
                   read.table('./train/subject_train.txt'))

test_set <- cbind(read.table('./test/X_test.txt'), 
                  read.table("./test/y_test.txt"),
                  read.table('./test/subject_test.txt'))
activity_labels <- read.table('./activity_labels.txt', col.names = c('levels', 'labels'))

# make combined set of train and test data
combined_set <- rbind(train_set, test_set)
features <- read.table("features.txt")

# build subset of variables we only will use to perform futture analysis
stdVariables <- features[grep("-std\\(\\)", features$V2),]$V1
meanVariables <- features[grep("-mean\\(\\)", features$V2),]$V1
variables <- c(stdVariables, meanVariables)

# will get variable names from features vector
variableNames <- as.character(features[variables, ]$V2)
# perform some clean ups on variable names(remove dashes, parenthesis etc)
variableNames <- cleanVariableNames(variableNames)

# add Subject and Activity variables to final datatset
variables <- c(563, 562, variables)
variableNames <- c("Subject", "Activity", variableNames)

# subset all selected variables to new dataset and assign varibles names
tidyResult <- data.table(combined_set[, variables])
setnames(tidyResult, old = colnames(tidyResult), new = variableNames)
tidyResult$Activity <- factor(tidyResult$Activity, activity_labels$levels, activity_labels$labels)

# calculate averaged values for all selected variables grouped by Subject and Activity 
averagedTideyResult <- tidyResult[, lapply(.SD, mean), by=list(Subject, Activity)][order(Subject,Activity)]

# save tidy results to file 
write.table(averagedTideyResult, "../tidy_dataset.txt", row.name=FALSE)
