## Step 1: Merges the training and the test sets to create one data set.
  1.1 Read x Test Data

  1.2 Read x Train Data

  1.3 Bind x Test and x Train using rbind
  
## Step 2:Extracts only the measurements on the mean and standard deviation for each measurement. 
  2.1 Read features.txt file
  
  2.2 Extract the second columns from features dataframe and apply it to data
  
  2.3 Extract only the columns that have mean or std in the column names using greg function
  

## Step 3:Uses descriptive activity names to name the activities in the data set
  3.1 Read y Test Data
  
  3.2 Read y Train Data
  
  3.3 Bind y Test and y Train using rbind
  
  3.4 Name column as "Activity"
  
  3.5 Read Labels from activity_labels.txt
  
  3.6 Name columns Activity and Label

  3.7 Using sqldf join matching Activity and extract Labels for the activity IDs

## Step 4:Appropriately labels the data set with descriptive variable names.
  4.1 Replace the variable names with shorter abbreviations with character denotion.
  
    Note: Abbreviations in Codebook
  
## Step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  5.1 Combine Activity Labels with the data
  
  5.2 Read test subject data
  
  5.3 Read train subject data
  
  5.4 Bind test and train subject data and name column as "Subject"
  
  5.5 Combine subject data with data
  
  5.6 Aggregate data by Subject and Label while applying the mean function
  
  5.7 Write the final output to a output.txt file.
