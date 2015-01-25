## What is in the repository  
This replository contains R code to clean up raw data from the [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Using this code data will be subseted, cleaned  and transformed to tidy data format. Cleaned data supposed to be used for later analysis. 

## How data clean up is performed  

Data clean up performed in several steps

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. (actually on this step code just select features containig substrings *std()* and *mean()* in the feature name, this is my interpretation of the ambiguous course project task )
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. (not sure i will perform this step on real world data cleanup, beacause raw dataset is small and can be fitted in the memory as is. )

## Prerequirements to run the code
This code requires existance of the folder with the raw data of the _Human Activity Recognition Using Smartphones Data Set_. Data should be downloaded from the url [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extracted to the working  directory with name _"UCI HAR Dataset"_

So in the *nix command line environment the working directory should look like this:

```
 -rw-r--r--  1 oleg  staff   8.2K Jan 26 02:25 CodeBook.md  
 -rw-r--r--  1 oleg  staff   569B Jan 26 02:47 README.md  
 drwxr-xr-x  2 oleg  staff    68B Jan 26 02:50 UCI HAR Dataset  
 -rw-r--r--  1 oleg  staff   710B Jan 26 01:46 clean_variable_names.R  
 -rw-r--r--  1 oleg  staff   2.2K Jan 26 01:50 run_analysis.R  
```

## How to run clean up code

To run clean up code, you can simplerun the command:
```
 R --vanilla -f run_analysis.R
```
Resulting tidy data set will be saved to the file *tidy_dataset.txt*.