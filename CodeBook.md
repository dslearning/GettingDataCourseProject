###Human Activity Recognition Using Smartphones Data Set

##Study design
The results of Samsung  experiment were downloaded from WEB-site by URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The data were extracted from ZIP archeve into current directory.

I used script "GetData.R" for downloading and extraction. 

After the script finished it work, we have folder "UCI HAR Dataset" in working directory
The structure is:
UCI HAR Dataset
               \train
                     \X_train.txt			-- this file contains the results of measurements
                     \Y_train.txt			-- this file contains the IDs of activities performed by volunteers 
                     \subject_train.txt		-- IDs of volunteers
               \test
                     \X_test.txt			-- this file contains the results of measurements
                     \Y_test.txt			-- this file contains the IDs of activities performed by volunteers 
                     \subject_test.txt		-- IDs of volunteers
                     \activity_labels.txt			-- List of activities
                     \features.txt			   	-- IDs of volunteers who took part in experiments

What do we do with data?
* load test & train data set and Y-values, load list of volunteers
* create matching between activity IDs and the names of activities (merge two data sets)
* load reference data (list of activities)
* select only colunms which names contain "mean" or "std" - mean value or standard deviation - from merged test & train data set
* Create data frame which contains: 
- ID of person who performed the experiment;
- the name of activity
- the results of measurement (from previous Item)
- Create data frame which contains the averaged values from previous step (grouped by Subject and ActivityName)
* write data frame into file

##Code book

* test_X - 2947 x 651 data.frame - test data set
* test_Y - 2947 x 1 data.frame - test Y-values (IDs of activities)
* train_X - 7352 x 561 data.frame - train data set
* train_Y - 7352 x 1 data.frame - train Y-values (IDs of activities)
* fullDS - 10299 x 561 data.frame - contains a combination of test & train data sets
* full_Y - 10299 x 1 data.frame - contains a combination of test & train Y-values (IDs of activities)
* subject_test - 2947 x 1 data.frame - testing IDs of volunteers who performed the test
* subject_train - 7352 x 1 data.frame - training IDs of volunteers who performed the test
* subjects_all - 10299 x 1 data.frame - combination of test and train IDs of volunteers
* activities - list of activities
* fts - 561 x 1 data.frame - list of features
col_ids - 79 x 2 data.frame - IDs of columnts which contains either "mean" or "std" - mean or standart deviation measurements
res - 10299 x 81 data.frame - full final data set
avg_res - 180 x 81 data.frame - contains averaded values from data frame "res"



### Final result set description

Subject				2
		Subject ID
		1..30		An identifier of the subject who carried out the experiment
ActivityName		18
		The name of activity performed by person
		WALKING 
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING 
		STANDING 
		LAYING
tBodyAcc-mean-X	16
		mean value of body acceleration signal by axis X
		-1..1
tBodyAcc-mean-Y	16
		mean value of body acceleration signal by axis Y
		-1..1
tBodyAcc-mean-Z	16
		mean value of body acceleration signal by axis Z
		-1..1
tBodyAcc-std-X	16
		Standard deviation of body acceleration signal by axis X
		-1..1
tBodyAcc-std-Y	16
		Standard deviation of body acceleration signal by axis Y
		-1..1
tBodyAcc-std-Z	16
		Standard deviation of body acceleration signal by axis Z
		-1..1
tGravityAcc-mean-X	16
		mean value of gravity acceleration signals by axis X
		-1..1
tGravityAcc-mean-Y	16
		mean value of gravity acceleration signals by axis X
		-1..1
tGravityAcc-mean-Z	16
		mean value of gravity acceleration signals by axis X
		-1..1
tGravityAcc-std-X	16
		Standard deviation of gravity acceleration signal by axis X
		-1..1
tGravityAcc-std-Y	16
		Standard deviation of gravity acceleration signal by axis X
		-1..1
tGravityAcc-std-Z	16
		Standard deviation of gravity acceleration signal by axis X
		-1..1
tBodyAccJerk-mean-X	16
		mean value of body linear acceleration signal by axis X
		-1..1
tBodyAccJerk-mean-Y	16
		mean value of body linear acceleration signal by axis Y
		-1..1
tBodyAccJerk-mean-Z	16
		mean value of body linear acceleration signal by axis Z
		-1..1
tBodyAccJerk-std-X	16
		Standard deviation of body linear acceleration signal by axis X
		-1..1
tBodyAccJerk-std-Y	16
		Standard deviation of body linear acceleration signal by axis Y
		-1..1
tBodyAccJerk-std-Z	16
		Standard deviation of body linear acceleration signal by axis Z
		-1..1
tBodyGyro-mean-X	16
		mean value of angular velocity signal by axis X
		-1..1
tBodyGyro-mean-Y	16
		mean value of angular velocity  signal by axis Y
		-1..1
tBodyGyro-mean-Z	16
		mean value of angular velocity  signal by axis Z
		-1..1
tBodyGyro-std-X	16
		Standard deviation of angular velocity  signal by axis X
		-1..1
tBodyGyro-std-Y	16
		Standard deviation of angular velocity  signal by axis Y
		-1..1
tBodyGyro-std-Z	16
		Standard deviation of angular velocity  signal by axis Z
		-1..1
tBodyGyroJerk-mean-X	16
		mean value of angular velocity  signal by axis X
		-1..1
tBodyGyroJerk-mean-Y	16
		mean value of angular velocity  signal by axis Y
		-1..1
tBodyGyroJerk-mean-Z	16
		mean value of angular velocity  signal by axis Z
		-1..1
tBodyGyroJerk-std-X	16
		Standard deviation of angular velocity  signal by axis X
		-1..1
tBodyGyroJerk-std-Y	16
		Standard deviation of angular velocity  signal by axis Y
		-1..1
tBodyGyroJerk-std-Z	16
		Standard deviation of angular velocity  signal by axis Z
		-1..1
tBodyAccMag-mean	16
		mean value of tBodyAccMag
		-1..1
tBodyAccMag-std	16
		Standard deviation of tBodyAccMag
		-1..1
tGravityAccMag-mean	16
		mean value of tGravityAccMag
		-1..1
tGravityAccMag-std	16
		Standard deviation of tGravityAccMag
		-1..1
tBodyAccJerkMag-mean	16
		mean value oftBodyAccJerkMag
		-1..1
tBodyAccJerkMag-std	16
		Standard deviation of tBodyAccJerkMag
		-1..1
tBodyGyroMag-mean	16
		mean value of body acceleration signal by axis X
		-1..1
tBodyGyroMag-std	16
		Standard deviation of body acceleration signal by axis X
		-1..1
tBodyGyroJerkMag-mean	16
		mean value of body acceleration signal by axis X
		-1..1
tBodyGyroJerkMag-std	16
		Standard deviation of body acceleration signal by axis X
		-1..1
fBodyAcc-mean-X	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyAcc-mean-Y	16
		mean value of body acceleration signal by axis Y
		-1..1
fBodyAcc-mean-Z	16
		mean value of body acceleration signal by axis Z
		-1..1
fBodyAcc-std-X	16
		Standard deviation of body acceleration signal by axis X
		-1..1
fBodyAcc-std-Y	16
		Standard deviation of body acceleration signal by axis Y
		-1..1
fBodyAcc-std-Z	16
		Standard deviation of body acceleration signal by axis Z
		-1..1
fBodyAcc-meanFreq-X	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyAcc-meanFreq-Y	16
		mean value of body acceleration signal by axis Y
		-1..1
fBodyAcc-meanFreq-Z	16
		mean value of body acceleration signal by axis Z
		-1..1
fBodyAccJerk-mean-X	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyAccJerk-mean-Y	16
		mean value of body acceleration signal by axis Y
		-1..1
fBodyAccJerk-mean-Z	16
		mean value of body acceleration signal by axis Z
		-1..1
fBodyAccJerk-std-X	16
		Standard deviation of body acceleration signal by axis X
		-1..1
fBodyAccJerk-std-Y	16
		mean value of body acceleration signal by axis Y
		-1..1
fBodyAccJerk-std-Z	16
		Standard deviation of body acceleration signal by axis Z
		-1..1
fBodyAccJerk-meanFreq-X	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyAccJerk-meanFreq-Y	16
		mean value of body acceleration signal by axis Y
		-1..1
fBodyAccJerk-meanFreq-Z	16
		mean value of body acceleration signal by axis Z
		-1..1
fBodyGyro-mean-X	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyGyro-mean-Y	16
		mean value of body acceleration signal by axis Y
		-1..1
fBodyGyro-mean-Z	16
		mean value of body acceleration signal by axis Z
		-1..1
fBodyGyro-std-X	16
		Standard deviation of body acceleration signal by axis X
		-1..1
fBodyGyro-std-Y	16
		Standard deviation of body acceleration signal by axis Y
		-1..1
fBodyGyro-std-Z	16
		Standard deviation of body acceleration signal by axis Z
		-1..1
fBodyGyro-meanFreq-X	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyGyro-meanFreq-Y	16
		mean value of body acceleration signal by axis Y
		-1..1
fBodyGyro-meanFreq-Z	16
		mean value of body acceleration signal by axis Z
		-1..1
fBodyAccMag-mean	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyAccMag-std	16
		Standard deviation of body acceleration signal by axis X
		-1..1
fBodyAccMag-meanFreq	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyBodyAccJerkMag-mean	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyBodyAccJerkMag-std	16
		Standard deviation of body acceleration signal by axis X
		-1..1
fBodyBodyAccJerkMag-meanFreq	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyBodyGyroMag-mean	16
		mean value of body acceleration signal by axis X
		-1..1
fBodyBodyGyroMag-std	16
		Standard deviation of fBodyBodyGyroMag
		-1..1
fBodyBodyGyroMag-meanFreq	16
		Standard deviation of fBodyBodyGyroMag
		-1..1
fBodyBodyGyroJerkMag-mean	16
		mean of BodyBodyGyroJerkMag
		-1..1
fBodyBodyGyroJerkMag-std	16
		Standard deviation of BodyBodyGyroJerkMag
		-1..1
fBodyBodyGyroJerkMag-meanFreq	16
		mean of BodyBodyGyroJerkMag
		-1..1
 








