#**Description of Getting and Cleaning the Samsung Data**

##** The Data##

  The data was obtaineed from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The data is down loaded into a zipped data set.  Once downloaded a directory is created called "Samsung" and the files are then unzipped into this directory.  Once unzipped the the directory structure is as follpws:
  
          -Samsung
            -UCI HAR Dataset
              -test
                -Inertial Signals
              -train
                -Intertial Signals
                
  The relevant files used for the project along with their directory location are:
  
    File |Location |Description
    ---- |-------- |-----------
    Features.txt |~Samsung/UCI HAR Dataset |The variable names for the test and train datasets
    Activity_labels.txt |~Samsung/UCI HAR Dataset |The names and numbers that correspond to the activity
    X_test.txt |~Samsung/UCI HAR Dataset/test |The data for the test dataset
    y_test.txt |~Samsung/UCI HAR Dataset/test |The activity codes 1-6 
    X_train.txt |~Samsung/UCI HAR Dataset/train |The data for the train dataset
    y_train.txt |~Samsung/UCI HAR Dataset/train |The activity codes 1-6
    Column.csv |~Samsung/UCI HAR Dataset |This file contains the variable names and the column numbers to extract the mean and std.  This file was created in excel.
    
  Description of the Activity_labels.txt
  
  Activity Number |Activity Label
  --------------- |--------------
  1 |Walking
  2 |Walking_Upstairs
  3 |Walking_Downstairs
  4 |Sitting
  5 |Standing
  6 |Laying
  
##**Program Flow and Tasks to Clean Data**

  1. Downloaded the data files and label files
  2. Merged in the activity number and converted it to a name
  3. Created a test and train file with 5 variables (File, Activity, Name, Mean, STD)
  4. Read in the "Column.csv" data
  5. Merged the two file into a file called "total.data"
  6. Extracted the Mean and Standard Deviation for measurement using the column indicator in Column.csv
  7. Creating a raw dataset called "tidy_data" with 5 variables (File, Activity, Name, Mean, STD)
  8. Aggregated the Mean and STF based on the Name and Activity
  9. Wrote the file to "tidy_data2"
  10. Then wrote it to "tidy_data_set.txt"
   
