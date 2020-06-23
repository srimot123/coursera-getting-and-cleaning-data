Follow below steps as described in the course project’s definition.

#	1. Download and extract the dataset  to a folder "HCI HAR Dataset"
		
#	2. Read each data file to below variables
		○ features <- features.txt : 561 rows, 2 columns
                    List of all features.
		○ activity_labels <- activity_labels.txt : 6 rows, 2 columns
                    Links the class labels with their activity name.
		○ data_test_x <- test/X_test.txt : 2947 rows, 561 columns
                    Recorded test set.
		○ data_test_y<- test/y_test.txt : 2947 rows, 1 columns
                    Test labels.
		○ data_test_subject <- test/subject_test.txt : 2947 rows, 1 column
		    Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
		○ data_train_x <- test/X_train.txt : 7352 rows, 561 columns
                    Recorded training set.
		○ data_train_y <- test/y_train.txt : 7352 rows, 1 columns
                   Training labels.
		○ data_train_subject <- test/subject_train.txt : 7352 rows, 1 column
		   Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
		
#       3. Merge the training and the test sets to create one data set
                ○ test_data data frame(2947 rows, 563 columns) is created by keeping data_test_x, data_test_y and data_test_subject in data frame
                ○ train_data data frame (7352 rows, 563 column) is created by keepingdata_train_x, data_train_y and data_train_subject in  data frame
                ○ merged_data (10299 rows, 563 column) is created by merging test_data and train_data using rbind()
#	4. Extracts only the measurements on the mean and standard deviation for each measurement
		○ Using grep identifying all the column labels having text 'mean or std' by checking in features variable which has all  the column labels
		○ Assign the data frame with selected Columns to new variable "data_mean_std_labels" (10299 rows, 88 columns)
#	5. Uses descriptive activity names to name the activities in the data set
		○ Read the activity_labels file to a new variable activity_labels
		○ Update the merged_data set labels using the activity_labels variable having values in Column 2 
#	6. Appropriately labels the data set with descriptive variable names
		○ Replace the open and closed parenthesis with "" (No Space) using gsub function
		○ Replace Acc in column’s name with Accelerometer
		○ Replace Gyro in column’s name with Gyroscope
		○ Replace Mag in column’s name with Magnitude
		○ Replace labels starting with f with Frequency
		○ Replace labels starting with t with Time
#	7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
		○ Using aggregate fucntion, computed the mean for each of these variables in merged_data df. Excluded activity and        subject in merged data as we are grouping by these fields
		○ Exported new_tidy_data into tidy_dataset.txt file
