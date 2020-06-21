getwd()
#setwd("C:/Users/smoturi/Downloads/RProject/Course3_Project")

# Store the link in a variable fileUrl
fileUrl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

# Download  the Zipped data from the URL to your Working Directory location as UCI HAR Datatset zipped folder
download.file(fileUrl,'./UCI HAR Dataset.zip', mode ='wb')

#Unzip the zipped file contents in working directory location
unzip("UCI HAR Dataset.zip", exdir = getwd())

#Read the features data into a data frame and select the 2nd column having the feature details
features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

# Read the test data to Variables
data_test_x <- read.table('./UCI HAR Dataset/test/X_test.txt')
#NROW(data_test_x)
data_test_y <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
#NROW(data_test_y)
data_test_subject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')
#NROW(data_test_subject)

# Read the train data to Variables
data_train_x <- read.table('./UCI HAR Dataset/train/X_train.txt')
data_train_y <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
data_train_subject <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')


#Keep all the test data in a data frame and label the column names accordingly
test_data <-  data.frame(data_test_subject, data_test_y, data_test_x)
#head(test_data,1)
names(test_data) <- c(c('subject', 'activity'), features)

#Keep all the train data in a data frame and label the column names accordingly
train_data <-  data.frame(data_train_subject, data_train_y, data_train_x)
names(train_data) <- c(c('subject', 'activity'), features)

# 1. Merges the training and the test sets to create one data set.

# merging both datasets into a new variable merged_data
merged_data <- rbind(test_data, train_data)
#NROW(merged_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

#?grep
# Using grep identifying all the column labels having text 'mean or std' by checking in features variable which has all the column labels
mean_std_columns <- grep('mean|std',features)
# Now we know the column labels having mean or std. Check in merged data for these columns except subject and activity as these are first 2 columns
# We need to exclude in our new variable and start searching from 3rd Column. We need to do search by 'mean_std_columns+2'

columns_selection<-c(1,2,mean_std_columns+2)
data_mean_std_labels <- merged_data[,columns_selection]
#head(data_mean_std_labels,1)

# 3. Uses descriptive activity names to name the activities in the data set

# Read the activity_labels file to a new variable actvitiy_labels
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity_labels <- as.character(activity_labels[,2])
#Updating the merged dataset activity numerics values by looking at activity_labels
merged_data$activity <- activity_labels[merged_data$activity]
#head(merged_data,1)

# 4. Appropriately labels the data set with descriptive variable names.

#?gsub
#?names
# Copy the merged dataset column labels to a new variable and cleanup the label names in this variable
desc_label_names <- names(merged_data)
#remove the open and closed paranthesis from label names
desc_label_names <- gsub("[(][)]", "", desc_label_names)
#Give descriptive names to shortcut labels like Acc, Gyro, Mag...
desc_label_names <- gsub("Acc", "Accelerometer", desc_label_names)
desc_label_names <- gsub("Gyro", "Gyroscope", desc_label_names)
desc_label_names <- gsub("Mag", "Magnitude", desc_label_names)

desc_label_names <- gsub("^f", "Frequency_", desc_label_names)
desc_label_names <- gsub("^t", "Time_", desc_label_names)
desc_label_names <- gsub("-mean-", "_Mean_", desc_label_names)
desc_label_names <- gsub("-std-", "_StandardDeviation_", desc_label_names)
desc_label_names <- gsub("-", "_", desc_label_names)

#Update the original merged dataset laebls using the labels from desc_label_names
names(merged_data) <- desc_label_names
#head(merged_data,1)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#?aggregate
# Passing the group by column names to a list
group_by <- list(activity = merged_data$activity, subject = merged_data$subject)
# Using aggregate, computing the mean for each of these variables. Excluding activity and subject in merged data as we are grouping by these fields
new_tidy_data <- aggregate(merged_data[,3:81],group_by,mean)
#head(new_tidy_data,10)
# Write this tidy_data to a file
write.table(x = new_tidy_data, file = "tidy_dataset.txt", row.names = FALSE)