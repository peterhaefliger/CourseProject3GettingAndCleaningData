# Coursera Getting and Cleaning Data Course Project #

This repository contains the solution to the course project of the Coursera course 
'Getting and Cleaning Data' (3rd course in the Data Science Specialization).

As the assignment instructions seem to be only accessible on the coursers website
for registered students, I will repeat them here:

## Instructions ##

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

Review criteria

- The submitted data set is tidy. 
- The Github repo contains the required scripts.
- GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
- The README that explains the analysis files is clear and understandable.
- The work submitted for this project is the work of the student who submitted it.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## My submission ##

In this repository I submit my solution to the assignment. It consists of:

- This readme.md file which gives an overview of the solution
- a tidy data set (data frame) with calculated means, called df_avg.txt
- a code book CodeBook.md which explains all the variables in the tidy data set
- a script run_analysis.R with which the tidy data set can be re-created from the initial data sets downloaded from the link in the instructions above

## run_analysis.R ##

I will not describe the R code in detail because the code is commented and should be self-explanatory. I will just give a high-level overview of the steps it performs and describe the environment on which it was run to produce the tidy data set df_avg.txt.

### high-level overview#

The script

- loads the dplyr library
- downloads data from the link in the instructions above and - if the .zip file is not already present - saves it into the current working directory.
- unzips the file (if the directory is not already present)
- loads the data into R, assigns it to dataframes and creates column names based on the meta data provided with the data set
- merges the test and training data sets into one big data set. As the raw data is spread accross several files, data has to be merged both row-wise (for test and training) as well as column-wise (for the different variables spread accross different files)
- extracts the values on the mean and standard deviation for each observation (with a regular expression on the column names) 
- provides descriptive activity names to name the activities in the data set by left-joining the activity names onto the data set and then removing the activity ids (or codes) as they are no longer needed.
- labels the data set with descriptive variable names by replacing all the abbreviations with their full terms, one by one
- creates a second, independent tidy data set with the average of each variable for each activity and each subject with the group_by and summarize verbs and the pipe operator from the dplyr library
- writes this second data set into a file df_avg.txt. If the file is already present, it will be overwritten.

### environment ###

I have run the script with R version 3.6.0 (2019-04-26) on the x86_64-w64-mingw32/x64 (64-bit) platform under Windows 10 x64 (build 18362) with dplyr_0.8.3 build under R version 3.6.1
