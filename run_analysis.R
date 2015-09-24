# Assume we have folder "UCI HAR Dataset" in working directory
# Structure is:
# UCI HAR Dataset
#                \train
#                      \X_train.txt
#                      \Y_train.txt
#                \test
#                      \X_test.txt
#                      \Y_test.txt


#loading test set
test_X<-read.table("UCI HAR Dataset/test/X_test.txt")
train_X<-read.table("UCI HAR Dataset/train/X_train.txt")

fullDS<-rbind(train_X, test_X)
if(nrow(fullDS) != nrow(test_X) + nrow(train_X)){
  stop("Something is wrong. The number of rows in resulting data set is not equals to sum if rows in train and test data sets")
}

#loading list of activities
activities<-read.table("UCI HAR Dataset/activity_labels.txt")

# Load and merge train and test Y values
test_Y<-read.table("UCI HAR Dataset/test/Y_test.txt")
train_Y<-read.table("UCI HAR Dataset/train/Y_train.txt")

# Merging Y values (activity ID) with names (activity name) 
full_Y<- inner_join( rbind(train_Y, test_Y) , activities)


# Load and merge train and test subjects (ID of subjects)
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subjects_all<-rbind(subject_train, subject_test)

colnames(subjects_all)<-"Subject"

#loading the full list of features
fts<-read.table("UCI HAR Dataset/features.txt")

fts$V2<-gsub("[()]", "", fts$V2)

# Exctacting all columns ID which names contains "mean" or "std"
#
col_ids<-fts[grepl("mean|std", fts[,2]),]
colnames(col_ids)<-c("ActivityID", "ActivityName")

# Will take only necessary columns (which names contain "mean" or "std")
res<-fullDS[, col_ids[,1]]

# Set names
colnames(res)<-col_ids[,2]
res<-cbind(subjects_all, ActivityName=full_Y[,2], res )


# Step 5. Creating a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
avg_res<-res %>% 
  group_by(Subject, ActivityName) %>% 
  summarise_each(funs(mean))


# Write results to file
write.table(x = avg_res, file = "TidyData.txt", row.name=FALSE, sep=",", dec=".")
