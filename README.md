# Samsung-Program-Assignment-
The submission of the program assignment for Getting and Cleaning Data

Author: Richard Fuchs

##** Program Flow

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
