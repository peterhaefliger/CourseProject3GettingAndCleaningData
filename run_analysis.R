# run_analysis.R
# Script for tidying a data set for the 'Getting and Cleaning Data' 
# Course Project (3rd course of the Coursera Data Science Specialization)

# load tidyverse library
library(dplyr)

# download and unzip data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
input_filename <- "UCI_HAR_Dataset.zip"
foldername <- "UCI HAR Dataset"
separator <- "/"
output_filename <- "df_avg.txt"
if (!file.exists(input_filename)){
    download.file(url, input_filename, method="curl")
}  
if (!file.exists(foldername)) { 
    unzip(filename) 
}

# load data into R, assign to dataframes, assign column names
# based on the meta data provided with the data set (REAMDE.txt, 
# features.txt, features_info.txt, activity_labels.txt)
features <- read.table(
    paste(foldername, "features.txt", sep = separator), 
    col.names = c("feature_id","feature_name"))
activities <- read.table(
    paste(foldername, "activity_labels.txt", sep = separator), 
    col.names = c("activity_id", "activity_name"))
subject_test <- read.table(
    paste(foldername, "test/subject_test.txt", sep = separator), 
    col.names = "subject_id")
x_test <- read.table(
    paste(foldername, "test/X_test.txt", sep = separator), 
    col.names = features$feature_name)
y_test <- read.table(
    paste(foldername, "test/y_test.txt", sep = separator), 
    col.names = "activity_id")
subject_train <- read.table(
    paste(foldername, "train/subject_train.txt", sep = separator), 
    col.names = "subject_id")
x_train <- read.table(
    paste(foldername, "train/X_train.txt", sep = separator), 
    col.names = features$feature_name)
y_train <- read.table(
    paste(foldername, "train/y_train.txt", sep = separator), 
    col.names = "activity_id")

# 1. Merge the training and the test sets to create one data set
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
df <- cbind(subject, y, x)

# 2. Extract only the measurements on the mean and standard deviation 
#    for each measurement. 
df <- select(df, subject_id, activity_id, contains("mean"), contains("std"))

# 3. Use descriptive activity names to name the activities in the data set

# join the activity names to the activity ids
df <- df %>% left_join(activities, by = "activity_id") %>% 

    # rearrange the columns so the activity names are more to the front
    # (i.e. to the left, adjacent to the activity ids)
    select(subject_id, activity_name, everything()) %>% 
    
    # replace the activity ids (this step and the previous two in fact
    # replace the activity ids by the activity names)
    select(-activity_id)

# 4. Appropriately label the data set with descriptive variable names

# read the column names into a temporary vector
dfcolnames <- colnames(df)

# remove the dots that got introduced when the data was imported
# (parentheses were transformed into dots)
dfcolnames <- gsub("\\.", "", dfcolnames)

# get rid of all abbreviations (except "std" which is common enough to be
# understood by everyone and whose replace would make the variable names
# even longer than they already are without any benefit). Use underscores
# instead of CamelCase (that's a matter of taste. I have more PL/SQL than
# Java background)
dfcolnames <- gsub("^f", "frequency_", dfcolnames)
dfcolnames <- gsub("^t", "time_", dfcolnames)
dfcolnames <- gsub("Acc", "accelerometer_", dfcolnames)
dfcolnames <- gsub("Gyro", "gyroscope_", dfcolnames)
dfcolnames <- gsub("Mag", "magnitude_", dfcolnames)
dfcolnames <- gsub("Freq", "frequency_", dfcolnames)
dfcolnames <- gsub("mean", "mean_", dfcolnames)
dfcolnames <- gsub("Mean", "mean_", dfcolnames)
dfcolnames <- gsub("std", "std_", dfcolnames)
dfcolnames <- gsub("Body", "body_", dfcolnames)
dfcolnames <- gsub("gravity", "gravity_", dfcolnames)
dfcolnames <- gsub("Gravity", "gravity_", dfcolnames)
dfcolnames <- gsub("Jerk", "jerk_", dfcolnames)
dfcolnames <- gsub("X", "x_", dfcolnames)
dfcolnames <- gsub("Y", "y_", dfcolnames)
dfcolnames <- gsub("Z", "z_", dfcolnames)
# remove the trailing underscores introduced by the above transformations
dfcolnames <- gsub("_$", "", dfcolnames)

# write the transformed column names back into the dataframe
colnames(df) <- dfcolnames

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
df_avg <- df %>% group_by(subject_id, activity_name) %>% summarize_all(mean)

# write the last data frame to a file
write.table(df_avg, file = output_filename, row.names = FALSE)