## Step 1: Merges the training and the test sets to create one data set.
  ## Read x Test Data
  ## Read x Train Data
  ## Bind x Test and x Train using rbind
  
## Step 2:Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## Read features.txt file
  ## Extract the second columns from features dataframe and apply it to data
  ## Extract only the columns that have mean or std in the column names using greg function

## Step 3:Uses descriptive activity names to name the activities in the data set
  ## Read y Test Data
  ## Read y Train Data
  ## Bind y Test and y Train using rbind
  ## Name column as "Activity"

  ## Read Labels from activity_labels.txt
  ## Name columns Activity and Label

  ## Using sqldf join matching Activity and extract Labels for the activity IDs

## Step 4:Appropriately labels the data set with descriptive variable names.
  ## Replace the variable names with shorter abbreviations with character denotion.
  ## Note: Abbreviations in Codebook
  
## Step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  ## Combine Activity Labels with the data
  ## Read test subject data
  ## Read train subject data
  ## Bind test and train subject data and name column as "Subject"
  ## Combine subject data with data
  ## Aggregate data by Subject and Label while applying the mean function
  ## Write the final output to a output.txt file.

