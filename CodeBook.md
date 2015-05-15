### The Data
------------
Wearable computing data collected from accelerometers from the Samsung Galaxy S smartphone
`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

A full description of th dataset is available at:
`http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones`

### Variables in Tidy.txt Dataset
------------------------------
10299 rows/observations, 68 columns/measurements
* First column: The subject number (1-30)
* Second column: The activity (LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, WALKING UPSTAIRS)
* Columns 3-68: The mean and standard deviation measurements. These are described in great detail in the `feature_info.txt` file, included in the data .zip file written above. These 66 measurements are:
3-8.   mean() and std() **tBodyAcc** in X,Y,Z
9-14.  mean() and std() **tGravityAcc** in X,Y,Z
15-20. mean() and std() **tBodyAccJerk** in X,Y,Z
21-26. mean() and std() **tBodyGyro** in X,Y,Z
27-32. mean() and std() **tBodyGyroJerk** in X,Y,Z
33-34. mean() and std() **tBodyAccMag**
35-36. mean() and std() **tGravityAccMag**
37-38. mean() and std() **tBodyAccJerkMag**
39-40. mean() and std() **tBodyGyroMag**
41-42. mean() and std() **tBodyGyroJerkMag**
43-48. mean() and std() **fBodyAcc** in X,Y,Z
49-54. mean() and std() **fBodyAccJerk** in X,Y,Z
55-60. mean() and std() **fBodyGyro** in X,Y,Z
61-62. mean() and std() **fBodyAccMag**
63-64. mean() and std() **fBodyAccJerkMag**
65-66. mean() and std() **fBodyGyroMag**
67-68. mean() and std() **fBodyGyroJerkMag**

Please see the `feature_info.txt` for more information.

### Procedure for producing the Tidy.txt Dataset
---------------------------------------------
To run the code: 
```S 
source("run_analysis.R")
``` 
in the directory where you want the /data/ directory to be created

1. Create a `/data/` directory, download the .zip file, and unzip
2. Read the .txt files into R data tables
3. Replace data in the `y_test` and `y_train` tables with descriptive activity names obtained from the `activity_labels` table
4. Set column names for the `X_test` and `X_train` measurement data with descriptions obtained from the `features` table
5. Set column names for `subject_test` and `subject_train` to be 'subject'
6. Merge the training tables to make a training dataset: `subject_test, y_test, X_test`
7. Merge the testing tables to make a testing dataset: `subject_train, y_train, X_train`
8. Row bind the training and testing datasets
9. Extract only the measurements on the mean() and std() in the merged dataset
10. Produce the tidy dataset by taking the means of all the measurement columns, for each subject and each activity






