Data Dictionary
===============

The raw data was obtained from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), the description of the original data can be found [here](
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


the meaning of the columns in *tidy.txt* is as follows:
-------------------------------------------------------

column   | description
---------|------------------------------
subject  | test subject id
activity | descriptive label of activity


All the other columns list the measurements as described in the *features_info.txt* file in the original raw data set. It should be noted that the features are not the original measurements but rather the mean of the measured variables for each subject [1-30] / Activity[1-6] combination.
