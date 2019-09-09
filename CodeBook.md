# Code Book #

The file df_avg.txt contains a tidy data set produced by the R script run_analysis.R (run in the environment described in the readme.md file) from the raw data downloaded from the link in the assignment instruction.

It contains 180 rows: one for each the 6 activities performed by each of the 30 subjects. It is a summary of the original data set which contains more than 10'000 observations. 

It contains 88 variables:

-  subject_id: The raw measurements data file in the original download did not contain the subject ids. They were recorded in a separate file and merged into the measurments data file by run_analysis.R. The subjects are anonymous, i.e. there are no names or other information about them, just number from 1 to 30.
- activity_name: The raw measurements data file in the original download did not contain the activity names but just ids (codes, 1 - 6). The mapping of the ids to activity names was provided in a separate file and merged into the measurements data file by run_analysis.R.

All other variables are means (over subject and activity) of the variables in the raw data which are described in detail in the code books provided there. For better readability, their names have been transformed by replacing all abbreviations (except std for standard deviation which is not domain-specific and should be known to any data scientist), more specifically the following replacements:

- f --> frequency
- t --> time
- acc --> accelerometer
- gyro --> gyroscope
- mag --> magnitude
- freq --> frequency
- mean --> mean

and by consequently using lower_case_and_underscores instead of CamelCase. This is of course a matter of taste. I have more of a PL/SQL than Java background.

The full list of variables is:

- time_body_accelerometer_mean_x
- time_body_accelerometer_mean_y
- time_body_accelerometer_mean_z
- time_gravity_accelerometer_mean_x
- time_gravity_accelerometer_mean_y
- time_gravity_accelerometer_mean_z
- time_body_accelerometer_jerk_mean_x
- time_body_accelerometer_jerk_mean_y
- time_body_accelerometer_jerk_mean_z
- time_body_gyroscope_mean_x
- time_body_gyroscope_mean_y
- time_body_gyroscope_mean_z
- time_body_gyroscope_jerk_mean_x
- time_body_gyroscope_jerk_mean_y
- time_body_gyroscope_jerk_mean_z
- time_body_accelerometer_magnitude_mean
- time_gravity_accelerometer_magnitude_mean
- time_body_accelerometer_jerk_magnitude_mean
- time_body_gyroscope_magnitude_mean
- time_body_gyroscope_jerk_magnitude_mean
- frequency_body_accelerometer_mean_x
- frequency_body_accelerometer_mean_y
- frequency_body_accelerometer_mean_z
- frequency_body_accelerometer_mean_frequency_x
- frequency_body_accelerometer_mean_frequency_y
- frequency_body_accelerometer_mean_frequency_z
- frequency_body_accelerometer_jerk_mean_x
- frequency_body_accelerometer_jerk_mean_y
- frequency_body_accelerometer_jerk_mean_z
- frequency_body_accelerometer_jerk_mean_frequency_x
- frequency_body_accelerometer_jerk_mean_frequency_y
- frequency_body_accelerometer_jerk_mean_frequency_z
- frequency_body_gyroscope_mean_x
- frequency_body_gyroscope_mean_y
- frequency_body_gyroscope_mean_z
- frequency_body_gyroscope_mean_frequency_x
- frequency_body_gyroscope_mean_frequency_y
- frequency_body_gyroscope_mean_frequency_z
- frequency_body_accelerometer_magnitude_mean
- frequency_body_accelerometer_magnitude_mean_frequency
- frequency_body_body_accelerometer_jerk_magnitude_mean
- frequency_body_body_accelerometer_jerk_magnitude_mean_frequency
- frequency_body_body_gyroscope_magnitude_mean
- frequency_body_body_gyroscope_magnitude_mean_frequency
- frequency_body_body_gyroscope_jerk_magnitude_mean
- frequency_body_body_gyroscope_jerk_magnitude_mean_frequency
- angletbody_accelerometer_mean_gravity
- angletbody_accelerometer_jerk_mean_gravity_mean
- angletbody_gyroscope_mean_gravity_mean
- angletbody_gyroscope_jerk_mean_gravity_mean
- anglex_gravity_mean
- angley_gravity_mean
- anglez_gravity_mean
- time_body_accelerometer_std_x
- time_body_accelerometer_std_y
- time_body_accelerometer_std_z
- time_gravity_accelerometer_std_x
- time_gravity_accelerometer_std_y
- time_gravity_accelerometer_std_z
- time_body_accelerometer_jerk_std_x
- time_body_accelerometer_jerk_std_y
- time_body_accelerometer_jerk_std_z
- time_body_gyroscope_std_x
- time_body_gyroscope_std_y
- time_body_gyroscope_std_z
- time_body_gyroscope_jerk_std_x
- time_body_gyroscope_jerk_std_y
- time_body_gyroscope_jerk_std_z
- time_body_accelerometer_magnitude_std
- time_gravity_accelerometer_magnitude_std
- time_body_accelerometer_jerk_magnitude_std
- time_body_gyroscope_magnitude_std
- time_body_gyroscope_jerk_magnitude_std
- frequency_body_accelerometer_std_x
- frequency_body_accelerometer_std_y
- frequency_body_accelerometer_std_z
- frequency_body_accelerometer_jerk_std_x
- frequency_body_accelerometer_jerk_std_y
- frequency_body_accelerometer_jerk_std_z
- frequency_body_gyroscope_std_x
- frequency_body_gyroscope_std_y
- frequency_body_gyroscope_std_z
- frequency_body_accelerometer_magnitude_std
- frequency_body_body_accelerometer_jerk_magnitude_std
- frequency_body_body_gyroscope_magnitude_std
- frequency_body_body_gyroscope_jerk_magnitude_std