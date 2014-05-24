## The purpose of this script is to read and extract desired information from the data collected for wearable computing

Function "run_analysis" takes no parameter and perform following steps.

Read all the measure names from the features.txt file. This resulting data frame contains two columns - index and name.

Find the index of those measures that have "-std" or "-mean" in their name.

Combine the training and the test sets to create one data set named 'data':
* Read the test subject data
* Read the test activity data 
* Read the test feature data 
* Read the train subject data 
* Read the train activity data 
* Read the train feature data  
* Column bind the feature, subject and activity data
* Row bind the test and training data

From the combined 'data', extract only those columns numbers as identified in step 2 and the subject and activity columns, and store the resulting dataset in 'df'	

Assign the activity column of 'df', the descriptive names.

From the dataset prepared in step 1, extract only the names at indexes identified by step 2. And remove the "()" and "-". Furthermore, replace starting t with avgT and starting f with avgF, to create appropriate column names for the final data set.  Thus, 'tBodyAcc-mean()-X' will be converted to 'avgTBodyAccmeanX'.

Use the resulting character set in the step 6 to define the columns names of 'df'. 

Aggregate the measurement columns of 'df' by Subject and Activity and find mean, to create tidy data set named 'out'.

As the aggregate function changes the grouping variable names into generic names of Group.1 and Group.2 and changes the position of group variables, rename the columns of 'out' appropriately.

Load plyr package as we will be using arrange function from this package.

Sort the data by Subject and Activity

Write the tidy data that contains Subject, Activity and average of the measures into a csv file.
