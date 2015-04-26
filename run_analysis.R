## run_analysis.R, 4/26/2015
##
## Works with the "Human Activity Recognition Using Smartphones Data Set". The script merges
## the training and the test sets and extracts only the measurements on the mean and standard
## deviation for each measurement.
## The output is a tidy data set with the average of each variable for each activity and each
## subject.
##
## Example:
##  setwd("R/course/Project-C&TD/UCI HAR Dataset/")         # enter the directory with project data
##  source("../run_analysis.R")
##
## Output:
##  the tidy.txt file written in the current working directory
##
## Caveats:
##  - fails when the data files are not found.


# sanity checks
require(data.table)

trainfiles      <- c("subject_train.txt","y_train.txt","X_train.txt")
testfiles       <- c("subject_test.txt", "y_test.txt", "X_test.txt")
if (!(all(sapply(trainfiles, function(x) {file.exists(file.path("train", x))})) &
    all(sapply( testfiles, function(x) {file.exists(file.path( "test", x))})))) {
    stop("Unable to find the data files, please check your working directory.")
}

# features and the activity names
features        <- read.table("features.txt",        col.names = c("id", "name"))
activity        <- read.table("activity_labels.txt", col.names = c("activityID", "name"))

# prepare a list of features related to mean or std
columns         <- rep("NULL", nrow(features))
indices         <- grep("(mean|std)\\(\\)", features$name)
columns[indices] <- "numeric"

# read and then merge the 'Measurements' data
trainMeasures   <- read.table(file.path("train", "X_train.txt"), colClasses = columns)
testMeasures    <- read.table(file.path("test" , "X_test.txt"),  colClasses = columns)
measures        <- rbind(trainMeasures, testMeasures)
rm(trainMeasures, testMeasures)

# read and then merge the 'Subject' data
trainSubjects   <- read.table(file.path("train", "subject_train.txt"))
testSubjects    <- read.table(file.path("test",  "subject_test.txt"))
subjects        <- rbind(trainSubjects, testSubjects)
rm(trainSubjects, testSubjects)
names(subjects) <- "subject"

# read and then merge the 'Activity' data
trainActivity   <- read.table(file.path("train", "y_train.txt"))
testActivity    <- read.table(file.path("test",  "y_test.txt"))
activities      <- rbind(trainActivity, testActivity)
rm(trainActivity, testActivity)
names(activities) <- "activityID"

# column merge the subjects to activities and to measurements
dataset <- cbind(subjects, activities, measures)
rm(subjects, activities, measures)

# replace integers with the 'meaningful activity names' and do the same also with the column names
dataset$activityID <- factor(dataset$activityID, labels = activity$name)
names(dataset)     <- c("subject", "activity", as.character(features$name[indices]))

# get the averages for the 'tidy data set' requested
dt <- data.table(dataset)
averages <- dt[, lapply(.SD, mean), by = c("subject", "activity")]
averages <- averages[order(averages$subject)]
rm(dt)

# write the result
write.table(averages, file="tidy.txt", row.name=FALSE)