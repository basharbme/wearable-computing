################################################################################
## This script does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
################################################################################

## Download and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(fileUrl, destfile = "temp", method = "curl")
unzip("temp", exdir = ".")
list.files("./")
unlink("temp")
list.files("./")

########################################################################
### 1. Merge the training and the test sets to create one data set. ####
########################################################################
# read names of features
features <- read.table("./UCI HAR Dataset/features.txt", sep = "")
features <- tbl_df(features)

# read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "")

# read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")

# combine train and test data
X <- rbind(X_train, X_test)
dim(X)

X2 <- tbl_df(X)


########################################################################
### 4. Label the data set with descriptive variable names ##############
########################################################################
names(X2) <- c(as.character(features$V2))
length(names(X2))


###############################################################################################
### 2. Extract only the measurements on the mean and standard deviation for each measurement. #
###############################################################################################
X3 <- X2[, grepl("mean|std", colnames(X2))]


# add Activity and Subject
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "")
X4_train <- cbind(subject_train, y_train)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "")
X4_test <- cbind(subject_test, y_test)

# combine train and test data
X4 <- rbind(X4_train, X4_test)
X5 <- cbind(X3, X4)

len <- length(names(X5))
names(X5)[len-1] <- "Subject"
names(X5)[len] <- "Activity"
names(X5)


################################################################################
### 3. Use descriptive activity names to name the activities in the data set ###
################################################################################
X5$Activity <- factor(X5$Activity, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


####################################################################################################
### 5. Create a tidy data set with the average of each variable for each activity and each subject #
####################################################################################################
X6 <- tbl_df(X5)
X7 <- group_by(X6, Activity, Subject)
X8 <- summarise_each(X7, funs(mean))

write.table(X8, file = "tidy.txt", row.names = FALSE)
