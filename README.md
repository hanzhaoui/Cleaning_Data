# Getting and Cleaning Data Course Project

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R script called run_analysis.R does the following:
1. Download and Unzip data sets.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. Creates an independent tidy data set with the average of each variable for each activity and each subject.

**Note** that it requires the reshape2 package, which can be downloaded from CRAN.

**The output** of the R script is a tidy data set, tidy.txt.
