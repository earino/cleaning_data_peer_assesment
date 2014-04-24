Codebook for Getting and Cleaning Data
===========================================

This codebook describes a number of things:

* the output file, uci_har_tidy.txt
* a very high level description of the original data set
* the process and choices used in generating uci_har_txt

uci_har_tidy.txt
------------------------

This file was generated using the R command 

      write.table(tidy_data_set, file="uci_har_tidy.txt", row.names=FALSE)

It can be loaded into R using the following command:

      > uci_har_tidy <- read.table("~/play/cleaning_data_peer_assesment/uci_har_tidy.txt", header=T, quote="\"")

When introspected, the resulting data.frame object looks as follows:

      > str(uci_har_tidy)
      'data.frame':  15480 obs. of  4 variables:
       $ subject : int  1 2 3 4 5 6 7 8 9 10 ...
       $ activity: Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
       $ variable: Factor w/ 86 levels "angle_x_gravity_mean",..: 57 57 57 57 57 57 57 57 57 57 ...
       $ value   : num  0.222 0.281 0.276 0.264 0.278 ...

### Variables

The variables in this data file are as follows:

#### subject

This is an integer between 1 and 30 which identifies an individual user who took part in the UCI HAR study.

#### activity

This is a factor with 6 levels which describes the activity that this observation describes. The 6 levels
which are in this variable are:

* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

#### variable

This is a factor with 86 levels which maps back to an original UCI HAR variable. The original names
for those variables can be read in UCI HAR Dataset/features.txt. They were transformed by using the
rattle function normVarNames, which normalizes them for easier use. These factor levels are as follows:

* angle_x_gravity_mean
* angle_y_gravity_mean
* angle_z_gravity_mean
* anglet_body_acc_jerk_mean_gravity_mean
* anglet_body_acc_mean_gravity
* anglet_body_gyro_jerk_mean_gravity_mean
* anglet_body_gyro_mean_gravity_mean
* f_body_acc_jerk_mean_freq_x
* f_body_acc_jerk_mean_freq_y
* f_body_acc_jerk_mean_freq_z
* f_body_acc_jerk_mean_x
* f_body_acc_jerk_mean_y
* f_body_acc_jerk_mean_z
* f_body_acc_jerk_std_x
* f_body_acc_jerk_std_y
* f_body_acc_jerk_std_z
* f_body_acc_mag_mean
* f_body_acc_mag_mean_freq
* f_body_acc_mag_std
* f_body_acc_mean_freq_x
* f_body_acc_mean_freq_y
* f_body_acc_mean_freq_z
* f_body_acc_mean_x
* f_body_acc_mean_y
* f_body_acc_mean_z
* f_body_acc_std_x
* f_body_acc_std_y
* f_body_acc_std_z
* f_body_body_acc_jerk_mag_mean
* f_body_body_acc_jerk_mag_mean_freq
* f_body_body_acc_jerk_mag_std
* f_body_body_gyro_jerk_mag_mean
* f_body_body_gyro_jerk_mag_mean_freq
* f_body_body_gyro_jerk_mag_std
* f_body_body_gyro_mag_mean
* f_body_body_gyro_mag_mean_freq
* f_body_body_gyro_mag_std
* f_body_gyro_mean_freq_x
* f_body_gyro_mean_freq_y
* f_body_gyro_mean_freq_z
* f_body_gyro_mean_x
* f_body_gyro_mean_y
* f_body_gyro_mean_z
* f_body_gyro_std_x
* f_body_gyro_std_y
* f_body_gyro_std_z
* t_body_acc_jerk_mag_mean
* t_body_acc_jerk_mag_std
* t_body_acc_jerk_mean_x
* t_body_acc_jerk_mean_y
* t_body_acc_jerk_mean_z
* t_body_acc_jerk_std_x
* t_body_acc_jerk_std_y
* t_body_acc_jerk_std_z
* t_body_acc_mag_mean
* t_body_acc_mag_std
* t_body_acc_mean_x
* t_body_acc_mean_y
* t_body_acc_mean_z
* t_body_acc_std_x
* t_body_acc_std_y
* t_body_acc_std_z
* t_body_gyro_jerk_mag_mean
* t_body_gyro_jerk_mag_std
* t_body_gyro_jerk_mean_x
* t_body_gyro_jerk_mean_y
* t_body_gyro_jerk_mean_z
* t_body_gyro_jerk_std_x
* t_body_gyro_jerk_std_y
* t_body_gyro_jerk_std_z
* t_body_gyro_mag_mean
* t_body_gyro_mag_std
* t_body_gyro_mean_x
* t_body_gyro_mean_y
* t_body_gyro_mean_z
* t_body_gyro_std_x
* t_body_gyro_std_y
* t_body_gyro_std_z
* t_gravity_acc_mag_mean
* t_gravity_acc_mag_std
* t_gravity_acc_mean_x
* t_gravity_acc_mean_y
* t_gravity_acc_mean_z
* t_gravity_acc_std_x
* t_gravity_acc_std_y
* t_gravity_acc_std_z

These variables can be decoded using the following rubric, splitting on underscores:

1. **t or f** - values starting with a 't' are time domain signals, values starting with 'f' are frequency domain signals OR starts with angle - this variable descrives variable momentum
2. **body or gravity** - body component of signal or gravity component of signal
3. **gyro or acc** - the variable comes from a gyroscope or accelerometer
4. **mean or std** - if this is a mean variable or a standard deviation variable (aggregates from the original data set)
5. **x or y or z or mean or std** - which individual input this variable describes

#### value

This is a numeric value, the mean of the underlying variable, which are themselves normalized unitless
variables from the original data set. From the original file at 'UCI HAR Dataset\README.txt:

      - Features are normalized and bounded within [-1,1].

The Original UCI HAR Dataset
--------------------------------------

A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

Process and Choices Made
--------------------------------------

The assingment was (probably deliberately) a little vague. Furthermore, unlike in a traditional commercial
engagement in which a client would encourage a back and forth dialogue asking questions, we were expected
to annotate our assumptions in this file. I understand why this is done for pedagogic purposes, but I must
submit a minor objection, that this is very much an acadmic practice, and in industry these assumptions
would be captured elsewhere.

### features.txt

An assumption is made as to the existence of a file called features.txt, it is also assumed that this
file contains a list of features to be extracted. This file is in the format:

    %head UCI\ HAR\ Dataset/features.txt 
    1 tBodyAcc-mean()-X
    2 tBodyAcc-mean()-Y
    3 tBodyAcc-mean()-Z
    4 tBodyAcc-std()-X
    5 tBodyAcc-std()-Y
    6 tBodyAcc-std()-Z
    7 tBodyAcc-mad()-X
    8 tBodyAcc-mad()-Y
    9 tBodyAcc-mad()-Z
    10 tBodyAcc-max()-X
    
Where each line has an index and a feature name. These are imported and turned into a vector which is
used by the software to set the names of the columns read from individual data files. These strings are
transformed using the two following R calls in order to remove commas or parenthesis, which may cause
issues in code further down the line:

    features <- gsub("[-,]", "_", features)
    features <- gsub("[()]", "", features)

### normVarNames

The features in this data set are named in a very unfriendly fashion. I call the rattle function 
normVarNames which normalizes a vector of strings with different capitalization/camel-case and use of 
dashes and underscores into a single nice and easy to understand standard. Example transformations:

Before          | After
----------------|---------------------
tBodyAcc_mean_X | t_body_acc_mean_x
tBodyAcc_mean_Y | t_body_acc_mean_y
tBodyAcc_mean_Z | t_body_acc_mean_z
tBodyAcc_std_X  | t_body_acc_std_x
tBodyAcc_std_Y  | t_body_acc_std_y
tBodyAcc_std_Z  | t_body_acc_std_z
tBodyAcc_mad_X  | t_body_acc_mad_x
tBodyAcc_mad_Y  | t_body_acc_mad_y 

### Variable Extraction

In the assingment, we are asked to extract only the mean/std variables for inclusion into the tidy data
set. I do this using the following R code:

      mean_and_std_dev <- mydata[,grep("mean|std|subject|activity", names(mydata))]

This code subsets only the columns in mydata, which trigger the regular expression 
mean|std|subject|activity. We have to also pull out subject and activity, as they will be used in the
downstream proces as identifiers for the tidying of this data set.

### Labeling Activities

This is done via a simple lookup table. I could have read the activities from in a similar fashion to
features.txt above, but for only 6 types of activities, it was simply easier to add them by hand.

### Transformation

Tidying is done via the melt function from the reshape2 package. Collapsing subject/activity/variable
tuples into means is done via the aggregate function.