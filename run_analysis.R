# 1. Merges the training and the test sets to create one data set

features <- rbind(featureTest, featureTrain)
activities <- rbind(activityTest, activityTrain)
subjects <- rbind(subjectTest, subjectTrain)

merged_data <- cbind(subjects, activities, features)

# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement

extracted_data <- merged_data %>% select(subject,
                                         activity,
                                         contains("mean"),
                                         contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set

extracted_data$activity <- activityLabels[extracted_data$activity, 2]

# 4. Appropriately labels the data set with descriptive variable names

names(extracted_data)<-gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data)<-gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data)<-gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data)<-gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data)<-gsub("^t", "Time", names(extracted_data))
names(extracted_data)<-gsub("^f", "Frequency", names(extracted_data))
names(extracted_data)<-gsub("()", "", names(extracted_data))
names(extracted_data)<-gsub("mean", "Mean", names(extracted_data))
names(extracted_data)<-gsub("std", "STD", names(extracted_data))
names(extracted_data)<-gsub("Freq", "Frequency", names(extracted_data))
names(extracted_data)<-gsub("angle", "Angle", names(extracted_data))
names(extracted_data)<-gsub("gravity", "Gravity", names(extracted_data))

# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.

second_data <- extracted_data %>%
               group_by(subject, activity) %>%
               summarize_all(mean)

write.table(second_data, "second_data.txt", row.name=FALSE)
