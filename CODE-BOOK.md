# CODEBOOK

## ORIGINAL FEATURE SELECTION 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean



## MODIFIED FEATURE SELECTION

The above features were sub-selected and rearranged in the following way:

1. The training and the test sets were merged to create one data set.
2. Only the measurements on the mean and standard deviation for each measurement were extracted.
3. Descriptive activity names were used to name the activities in the data set:
  - WALKING (1)
  - WALKING_UPSTAIRS (2)
  - WALKING_DOWNSTAIRS (3)
  - SITTING (4)
  - STANDING (5)
  - LAYING (6)
4. The data set was labeled with appropriate descriptive variable names.
5. The data set was grouped on two levels: first by Activity, and then by Subject.
6. A second, independent tidy data set with the average of each variable for each activity and each subject was produced, with the following features (the first two variables are factors, the others are all double-precision numerics):
 - Activity [factor]
 - Subject [factor]
 - tBodyAcc-mean()-X [numeric]
 - tBodyAcc-mean()-Y [numeric]
 - tBodyAcc-mean()-Z [numeric]
 - tBodyAcc-std()-X [numeric]
 - tBodyAcc-std()-Y [numeric]
 - tBodyAcc-std()-Z [numeric]
 - tGravityAcc-mean()-X [numeric]
 - tGravityAcc-mean()-Y [numeric]
 - tGravityAcc-mean()-Z [numeric]
 - tGravityAcc-std()-X [numeric]
 - tGravityAcc-std()-Y [numeric]
 - tGravityAcc-std()-Z [numeric]
 - tBodyAccJerk-mean()-X [numeric]
 - tBodyAccJerk-mean()-Y [numeric]
 - tBodyAccJerk-mean()-Z [numeric]
 - tBodyAccJerk-std()-X [numeric]
 - tBodyAccJerk-std()-Y [numeric]
 - tBodyAccJerk-std()-Z [numeric]
 - tBodyGyro-mean()-X [numeric]
 - tBodyGyro-mean()-Y [numeric]
 - tBodyGyro-mean()-Z [numeric]
 - tBodyGyro-std()-X [numeric]
 - tBodyGyro-std()-Y [numeric]
 - tBodyGyro-std()-Z [numeric]
 - tBodyGyroJerk-mean()-X [numeric]
 - tBodyGyroJerk-mean()-Y [numeric]
 - tBodyGyroJerk-mean()-Z [numeric]
 - tBodyGyroJerk-std()-X [numeric]
 - tBodyGyroJerk-std()-Y [numeric]
 - tBodyGyroJerk-std()-Z [numeric]
 - tBodyAccMag-mean() [numeric]
 - tBodyAccMag-std() [numeric]
 - tGravityAccMag-mean() [numeric]
 - tGravityAccMag-std() [numeric]
 - tBodyAccJerkMag-mean() [numeric]
 - tBodyAccJerkMag-std() [numeric]
 - tBodyGyroMag-mean() [numeric]
 - tBodyGyroMag-std() [numeric]
 - tBodyGyroJerkMag-mean() [numeric]
 - tBodyGyroJerkMag-std() [numeric]
 - fBodyAcc-mean()-X [numeric]
 - fBodyAcc-mean()-Y [numeric]
 - fBodyAcc-mean()-Z [numeric]
 - fBodyAcc-std()-X [numeric]
 - fBodyAcc-std()-Y [numeric]
 - fBodyAcc-std()-Z [numeric]
 - fBodyAcc-meanFreq()-X [numeric]
 - fBodyAcc-meanFreq()-Y [numeric]
 - fBodyAcc-meanFreq()-Z [numeric]
 - fBodyAccJerk-mean()-X [numeric]
 - fBodyAccJerk-mean()-Y [numeric]
 - fBodyAccJerk-mean()-Z [numeric]
 - fBodyAccJerk-std()-X [numeric]
 - fBodyAccJerk-std()-Y [numeric]
 - fBodyAccJerk-std()-Z [numeric]
 - fBodyAccJerk-meanFreq()-X [numeric]
 - fBodyAccJerk-meanFreq()-Y [numeric]
 - fBodyAccJerk-meanFreq()-Z [numeric]
 - fBodyGyro-mean()-X [numeric]
 - fBodyGyro-mean()-Y [numeric]
 - fBodyGyro-mean()-Z [numeric]
 - fBodyGyro-std()-X [numeric]
 - fBodyGyro-std()-Y [numeric]
 - fBodyGyro-std()-Z [numeric]
 - fBodyGyro-meanFreq()-X [numeric]
 - fBodyGyro-meanFreq()-Y [numeric]
 - fBodyGyro-meanFreq()-Z [numeric]
 - fBodyAccMag-mean() [numeric]
 - fBodyAccMag-std() [numeric]
 - fBodyAccMag-meanFreq() [numeric]
 - fBodyBodyAccJerkMag-mean() [numeric]
 - fBodyBodyAccJerkMag-std() [numeric]
 - fBodyBodyAccJerkMag-meanFreq() [numeric]
 - fBodyBodyGyroMag-mean() [numeric]
 - fBodyBodyGyroMag-std() [numeric]
 - fBodyBodyGyroMag-meanFreq() [numeric]
 - fBodyBodyGyroJerkMag-mean() [numeric]
 - fBodyBodyGyroJerkMag-std() [numeric]
 - fBodyBodyGyroJerkMag-meanFreq() [numeric]
