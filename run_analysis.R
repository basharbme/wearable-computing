
# Download and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

temp <- tempfile()
download.file(fileUrl, destfile = "temp", method = "curl")
unzip("temp", exdir = ".")
list.files("./")
unlink("temp")
list.files("./")

## TRAIN
# Inertial Signals
#body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", sep = "")
#length(names(body_acc_x_train))

#body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", sep = "")
#length(names(body_gyro_x_train))

#total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", sep = "")
#length(names(total_acc_x_train))

#9*128
#[1] 1152

########################################################################
### Merges the training and the test sets to create one data set. ######
########################################################################
# read names of features
features <- read.table("./UCI HAR Dataset/features.txt", sep = "")
features <- tbl_df(features)

# read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "")
#X_train <- tbl_df(X_train)
dim(X_train)

#
#subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "")
#dim(subject_train)

#y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "")
#dim(y_train)
#

#X_train_y <- bind_cols(X_train, y_train)
#X_train_y <- cbind(X_train, subject_train, y_train)
#dim(X_train_y)


# read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")
#X_test <- tbl_df(X_test)
dim(X_test)

#
#subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "")
#dim(subject_test)

#y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "")
#dim(y_test)

#X_test_y <- bind_cols(X_test, y_test)
#X_test_y <- cbind(X_test, subject_test, y_test)
#dim(X_test_y)

# combine train and test data
#X <- bind_rows(X_train_y, X_test_y)
#X <- rbind(X_train_y, X_test_y)
X <- rbind(X_train, X_test)
dim(X)

X2 <- tbl_df(X)

# descriptive variable names
#names(X2) <- c(as.character(features$V2), "Subject", "Activity")
names(X2) <- c(as.character(features$V2))
length(names(X2))


###############################################################################################
### Extracts only the measurements on the mean and standard deviation for each measurement. ###
###############################################################################################
#X2 %>% select(contains(mean))
X3 <- X2[, grepl("mean|std", colnames(X2))]



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

# descriptive activity names
X5$Activity <- factor(X5$Activity, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
#X5$Subject <- factor(X5$Subject)

X6 <- tbl_df(X5)

X7 <- group_by(X6, Activity, Subject)
#X8 <- summarise(X7, mean(X7$"tBodyAcc-mean()-X"))
X8 <- summarise_each(X7, funs(mean))


