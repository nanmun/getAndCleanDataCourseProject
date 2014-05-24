## DATA DICTIONARY - TidyData

TidyData has been derived from the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The original Human Activity Recognition database can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.

The TidyData contains the average of each variable for each activity and each subject. 
The columns in this data are as follows:

Record Number - Line number or record number of the data. 30 subjects with 6 activities each. Hence, Total 30 X 6 = 180 records.
	
Subject - Subject/Volunteer number who participated in the experiment. Value from 1 to 30

Activity - Activity performed by the Subject. Values can be - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 	

Rest of the columns in this dataset are the average (mean) of the mean values and standard deviation values of various signal measures.

E.g.

avgTBodyAccmeanX - Mean of tBodyAcc-mean()-X
avgTBodyAccmeanY - Mean of tBodyAcc-mean()-Y
avgTBodyAccmeanZ - Mean of tBodyAcc-mean()-Z

avgTBodyAccstdX - Mean of tBodyAcc-std()-X
avgTBodyAccstdY - Mean of tBodyAcc-std()-Y
avgTBodyAccstdZ - Mean of tBodyAcc-std()-Z

avgFBodyAccmeanX - Mean of fBodyAcc-mean()-X
avgFBodyAccmeanY - Mean of fBodyAcc-mean()-Y	
avgFBodyAccmeanZ - Mean of fBodyAcc-mean()-Z

and so on.


