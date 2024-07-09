CodeBook
================

This code book describes the variables, the data, and any
transformations or work that run_analysis.R performs to clean up the
data.

## Download the data set

Data set was downloaded via this
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and extracted under the folder called `UCI HAR data set`.

## Assign each data set to an object

- `featureNames` \<- `features.txt` : 561 rows, 2 columns  
  The features selected for this database come from the accelerometer
  and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- `activityLabels` \<- `activity_labels.txt` : 6 rows, 2 columns  
  List of activities performed when the corresponding measurements were
  taken and its labels

### test

- `subjectTest` \<- `test/subject_test.txt` : 2947 rows, 1 column  
  contains test data of 9/30 volunteer test subjects being observed
- `featureTest` \<- `test/X_test.txt` : 2947 rows, 561 columns  
  contains recorded features test data
- `activityTest` \<- `test/y_test.txt` : 2947 rows, 1 columns  
  contains test data of activities’code labels

### train

- `subjectTrain` \<- `test/subject_train.txt` : 7352 rows, 1 column  
  contains train data of 21/30 volunteer subjects being observed
- `featureTrain` \<- `test/X_train.txt` : 7352 rows, 561 columns  
  contains recorded features train data
- `activityTrain` \<- `test/y_train.txt` : 7352 rows, 1 columns  
  contains train data of activities’code labels

## Merge the test and train data sets to create one data set

- `features` (10299 rows, 561 columns) is created by merging
  `featureTest` and `featureTrain` using **rbind()** function
- `activities` (10299 rows, 1 column) is created by merging
  `activityTest` and `activityTrain` using **rbind()** function
- `subjects` (10299 rows, 1 column) is created by merging `subjectTest`
  and `subjectTrain` using **rbind()** function
- `merged_data` (10299 rows, 563 column) is created by merging
  `subjects`, `activities` and `features` using **cbind()** function

## Extract only the meansurements on the mean value and standard deviation for each measurement

`extracted_data` (10299 rows, 88 columns) is created by subsetting
`merged_data`, selecting only columns: `subject`, `activity` and the
measurements on the mean value (`mean`) and standard deviation (`std`)
for each measurement.

## Use descriptive activity names to name the activities in the data set

Entire numbers in `activity` column of the `extracted_data` replaced
with corresponding activity taken from second column of the `activities`
data set.

## Appropriately labels the data set with descriptive variable name

- All `Acc` in column’s name is replaced by `Accelerometer`
- All `Gyro` in column’s name is replaced by `Gyroscope`
- All `BodyBody` in column’s name is replaced by `Body`
- All `Mag` in column’s name is replaced by `Magnitude`
- All start with character `f` in column’s name is replaced by
  `Frequency`
- All start with character `t` in column’s name is replaced by `Time`
- All `()` in column’s name is deleted
- All `mean` in column’s name is replaced by `Mean`
- All `std` in column’s name is replaced by `STD`
- All `Freq` in column’s name is replaced by `Frequency`
- All `angle` in column’s name is replaced by `Angle`
- All `gravity` in column’s name si replaced by `Gravity`

## Creates a second data set with the average of each variable for each activity and each subject

`second_data` (180 rows, 88 columns) is created by sumarizing
`extracted_data` taking the means of each variable for each activity and
each subject, after grouped by `subject` and `activity`.
