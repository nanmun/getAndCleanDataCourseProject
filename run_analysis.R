run_analysis <- function() {

  # Read all the measurement names from features.txt
  allmeasures <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
  
  # Get index of measuresments that have "-mean" or "-std" in its name
  mymeasures <- grep("-mean|-std", allmeasures[,2])
  
  
  # Read the test subject data 
  testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
  
  # Read the test activity data 
  testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
  
  # Read the test feature data 
  testfeature <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
  
  
  # Read the test subject data 
  trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
  
  # Read the test activity data 
  trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

  # Read the training data  
  trainfeature <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
  
  
  # Combine the features, subject and activity data of test and train datasets
  testdata <- cbind(cbind(testfeature,testsubject,testactivity))
  traindata <- cbind(cbind(trainfeature,trainsubject,trainactivity))
  
    
  # Combine test and train  datasets
  data <- rbind(testdata,traindata)
  
  
  # Sub dataset to extract only the mean and std features; and the last two columns which store the Subject and Activity
  df = data[,c(mymeasures,ncol(data)-1,ncol(data))]
  
  # Find the activity column number in the subset (it is the last column)
  activitycol = ncol(df)

  # Descriptive activity names
  for (i in 1:nrow(df)) 
  { 
    if (df[i,activitycol]=="1") df[i,activitycol] <- "WALKING" 
    else if (df[i,activitycol]=="2") df[i,activitycol] <- "WALKING_UPSTAIRS" 
    else if (df[i,activitycol]=="3") df[i,activitycol] <- "WALKING_DOWNSTAIRS" 
    else if (df[i,activitycol]=="4") df[i,activitycol] <- "SITTING" 
    else if (df[i,activitycol]=="5") df[i,activitycol] <- "STANDING" 
    else if (df[i,activitycol]=="6") df[i,activitycol] <- "LAYING" 
    else df[i,activitycol] <- df[i,activitycol] 
  }

  
  # Extract only mean and std measure names. And remove "()" and "-"
  cols <-  gsub("[()-]","",allmeasures[mymeasures,2])
  
  # Replace starting t with avgT; starting f with avgF 
  # Thus, tBodyAccmeanX becomes avgTBodyAccmeanX
  cols <-  gsub("^t", "avgT", gsub("^f", "avgF", cols))

  
  # Assign column names to dataframe df
  colnames(df) <- c(cols, "Subject", "Activity")
  
  
  # Aggregate the measurement columns by Subject and Activity and take mean to create tidy data set.
  out <- aggregate(df[,1:length(mymeasures)], by=list(df$Subject, df$Activity),FUN=mean) 
  
  
  # The aggregate function above had changed the group variable names 
  # into generic names of Group.1 and Group.2 and chnages the position of group variables. 
  # Therefore column renaming is required one more time 
  
  colnames(out) <- c("Subject", "Activity", cols)
  
  
  # load the package for arrange function (called later on)
  require(plyr)
  
  # sort the data by Subject and Activity
  out <- arrange(out,out$Subject,out$Activity)
  
  # write the tidy data to a csv file
  write.csv(out,"TidyData.csv")
  
  
}