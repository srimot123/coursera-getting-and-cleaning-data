# coursera-getting-and-cleaning-data

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

# How to Run this Script:

  1) Download the user activity data zip file from the above link
  2) Unzip the folder
  3) Run the run_analysis.R Script which performs below steps:
        a) Merges the training and the test sets to create one data set.
        b) Extracts only the measurements on the mean and standard deviation for each measurement.
        c) Uses descriptive activity names to name the activities in the data set
        d) Appropriately labels the data set with descriptive variable names.
        e) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  4) Last line within this R Script creates final dataset "tidy_dataset.txt" file in your working directory
  
# Code book:
  Check the code book for all the variables and summaries calculated, along with units, and other relevant information of this file.
