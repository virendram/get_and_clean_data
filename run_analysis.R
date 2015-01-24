#Getting and Cleaning data--Assignment 2
#Virendra R Mishra
#01/24/2015

setwd("C:\\Users\\Virendra\\Documents\\get_and_clean_data\\Assignment_2\\getdata_projectfiles_UCI HAR Dataset\\")

#Read the dataset
training = read.csv("UCI HAR Dataset\\train\\X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("UCI HAR Dataset\\train\\Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI HAR Dataset\\train\\subject_train.txt", sep="", header=FALSE)
testing = read.csv("UCI HAR Dataset/test\\X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("UCI HAR Dataset\\test\\Y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("UCI HAR Dataset\\test\\subject_test.txt", sep="", header=FALSE)
activityLabels = read.csv("UCI HAR Dataset\\activity_labels.txt", sep="", header=FALSE)

# Read features and make the feature names better suited for R with some substitutions
features = read.csv("UCI HAR Dataset\\features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merge training and test sets together
merged_data = rbind(training, testing)

# Get only the data on mean and std. dev.
cols_to_use <- grep(".*Mean.*|.*Std.*", features[,2])

# First reduce the features table to what we want
features <- features[cols_to_use,]

# Now add the last two columns (subject and activity)

cols_to_use <- c(cols_to_use, 562, 563)

# And remove the unwanted columns from merged_data
merged_data <- merged_data[,cols_to_use]

# Add the column names (features) to allData
colnames(merged_data) <- c(features$V2, "Activity", "Subject")
colnames(merged_data) <- tolower(colnames(merged_data))
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
        merged_data$activity <- gsub(currentActivity, currentActivityLabel, merged_data$activity)
        currentActivity <- currentActivity + 1
}
merged_data$activity <- as.factor(merged_data$activity)
merged_data$subject <- as.factor(merged_data$subject)
tidy = aggregate(merged_data, by=list(activity = merged_data$activity, subject=merged_data$subject), mean)

# Remove the subject and activity column, since a mean of those has no use
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t",row.name=FALSE)