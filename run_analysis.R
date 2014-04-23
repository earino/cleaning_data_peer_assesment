###
### Peer programming assingment for Coursera course Getting and Cleaning Data
###   
### Author:   Eduardo Ariño de la Rubia
### Session:  getdata-002
### Date:     April 23, 2014
###
### Assingment Test:
###
###  You should create one R script called run_analysis.R that does the following:
###
###     1) Merges the training and the test sets to create one data set.
###     2) Extracts only the measurements on the mean and standard deviation for each measurement. 
###     3) Uses descriptive activity names to name the activities in the data set
###     4) Appropriately labels the data set with descriptive activity names. 
###     5) Creates a second, independent tidy data set with the average of each variable 
###        for each activity and each subject. 
###

###
### Include libraries
###

library(rattle, quietly=TRUE)   # for normVarNames
library(reshape, quietly=TRUE)  # for melt

###
### SET UP ENVIRONMENT
###

activity_labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                     "SITTING", "STANDING", "LAYING")

wd <- getwd()

original_dataset_path <- file.path(wd, original_dataset_directory)

###
### Retrieve features from features text file, to build column names 
###

features_path <- file.path(original_dataset_path, "features.txt")
features <- t(t(read.table(features_path, quote="\""))[2,])
features <- gsub("[-,]", "_", features)
features <- gsub("[()]", "", features)

###
### Retrieve train and test data, and merge them together
###

# convenience function for passing a root directory and a label, and
# extracting data in the UCI HAR Dataset format.
load_files_at_path <- function(root, label) {
  target <- file.path(original_dataset_path, label)
  
  subject <- read.table(file.path(target, paste0("subject_", label, ".txt")), quote="\"")
  X <- read.table(file.path(target, paste0("X_", label, ".txt")), quote="\"")
  y <- read.table(file.path(target, paste0("y_", label, ".txt")), quote="\"")
  
  mydata <- cbind(subject, X, y)
  colnames(mydata) <- c("subject", features, "activity")
  
  return(mydata)
}

mydata <- rbind(load_files_at_path(original_dataset_path, "train"),
                load_files_at_path(original_dataset_path, "test"))

names(mydata) <- normVarNames(names(mydata))

###
### Extract any variables from this data set with a name that matches the regular expression
###     in the grep command. We have to retain the subject and activity variables in order to
###     use them in the tidying of the data, the obervation data will be the mean and standard 
###     deviation for each measurement
###

mean_and_std_dev <- mydata[,grep("mean|std|subject|activity", names(mydata))]

###
### Label the activities appropriately
###

mean_and_std_dev$activity <- activity_labels[mean_and_std_dev$activity]

###
### Turn the data set into a tidy data set
###

molten_frame <- melt(mean_and_std_dev, id=c("subject", "activity"))

###
### Aggregate the data set on subject/activity/variable tuples
###

tidy_data_set <- aggregate(molten_frame$value, 
                           by=list(subject=molten_frame$subject, 
                                   activity=molten_frame$activity, 
                                   variable=molten_frame$variable), 
                           mean)

### Write out the data
write.table(tidy_data_set, file="uci_har_tidy.txt", row.names=FALSE)
