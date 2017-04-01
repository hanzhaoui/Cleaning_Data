library(data.table)
library(reshape2)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
unzip("dataset.zip")

# Load activity data sets
test.act <- read.table("UCI HAR Dataset/test/y_test.txt", header = F)
train.act <- read.table("UCI HAR Dataset/train/y_train.txt", header = F)

# Load subject data sets
test.sub <- read.table("UCI HAR Dataset/test/subject_test.txt", header = F)
train.sub <- read.table("UCI HAR Dataset/train/subject_train.txt", header = F)

# Load feature data sets
test.fea <- read.table("UCI HAR Dataset/test/X_test.txt", header = F)
train.fea <- read.table("UCI HAR Dataset/train/X_train.txt", header = F)

# Merge data sets
act <- rbind(test.act, train.act)[,1]
sub <- rbind(test.sub, train.sub)[,1]
fea <- rbind(test.fea, train.fea)

# Name the merged feature data set
fea.names <- read.table("UCI HAR Dataset/features.txt", header=F)[, 2]
names(fea) <- fea.names

# Extract only the measurement on the mean and std for the feature data set
selected <- grep("(mean|std)\\(\\)", names(fea))
fea.selected <- fea[, selected]

# Appropriately lable the fea.selected data set
names(fea.selected) <- gsub("^t", "Time", names(fea.selected))
names(fea.selected) <- gsub("^f", "Frequency", names(fea.selected))
names(fea.selected) <- gsub("-mean\\(\\)", "Mean", names(fea.selected))
names(fea.selected) <- gsub("-std\\(\\)", "StdDev", names(fea.selected))
names(fea.selected) <- gsub("-", "", names(fea.selected))
names(fea.selected) <- gsub("BodyBody", "Body", names(fea.selected))

# Name the merged activity data set
act.names <- read.table("UCI HAR Dataset/activity_labels.txt", header=F)[, 2]
act <- act.names[act]

# Create the combined tidy data set
combined <- cbind(Subject = sub, Activity=act, fea.selected)


# Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

melted <- melt(combined, id = c("Subject", "Activity"))
tidy <- dcast(melted, Subject+Activity ~ variable, mean)

# Write the tidy data set to a file
write.table(tidy, "tidy.txt", row.names = F)


