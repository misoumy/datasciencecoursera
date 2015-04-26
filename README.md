Getting and Cleaning Data
=========================

Course Project (Coursera)

Description
-----------

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The R script called *run_analysis.R* does the following. 

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


What you find in this repository
--------------------------------

* *CodeBook.md*: information about raw and tidy data set 
* *README.md*: this file
* *run_analysis.R*: R script to transform raw data set in a tidy one
* *tidy.txt*: a tidy data set obtained following the instructions in the description of the course project. To load and check the data, you can use the read.table as described below:
```
    averages <- read.table("tidy.txt", header=TRUE)
```

How to
------

* clone this repository
* download compressed raw data using the link above
* unzip raw data and copy the directory 'UCI HAR Dataset' to the cloned repository root directory
* open a R console and set the working directory to the 'UCI HAR Dataset'
```
    setwd("{...}UCI HAR Dataset")
```
* run *run_analysis.R* script 
```
    source("run_analysis.R")
```