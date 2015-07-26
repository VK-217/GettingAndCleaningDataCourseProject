## Step 1: Merges the training and the test sets to create one data set.
  x_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
  x_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
  data <- rbind(x_test,x_train)
  
## Step 2:Extracts only the measurements on the mean and standard deviation for each measurement. 
  features <- read.table(".\\UCI HAR Dataset\\features.txt")
  colnames(data) <- features[,2]
  data <- data[,grep("mean|std",names(data),value=TRUE)]

## Step 3:Uses descriptive activity names to name the activities in the data set
  y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
  y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
  a_data <- rbind(y_test,y_train)
  names(a_data)<- "Activity"

  label <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
  names(label) <- c("Activity","Label")

  a_data <-sqldf("select Label from a_data join label using(Activity)")

## Step 4:Appropriately labels the data set with descriptive variable names.
  ## Note:Eventhough it says descriptive,I prefer short forms for column names
  names(data) <- gsub('Body','B',names(data))
  names(data) <- gsub('Gravity','G',names(data))
  names(data) <- gsub('Gyro','g',names(data))
  names(data) <- gsub('Jerk','J',names(data))
  names(data) <- gsub('Acc','A',names(data))
  names(data) <- gsub('Mag','M',names(data))
  names(data) <- gsub('mean','AVG',names(data))
  names(data) <- gsub('std','SD',names(data))
  names(data) <- gsub('f','',names(data))
  names(data) <- gsub('t','',names(data))
  names(data) <- gsub("\\(|\\)", "",names(data))
  
## Step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  data <- cbind(a_data,data)

  subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
  subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
  subject <- rbind(subject_test,subject_train)
  names(subject) <- "Subject"

  data <- cbind(subject,data)
  data <- aggregate(. ~ Subject+Label,data=data,FUN=mean )

  write.table(data, file="./output.txt", sep="\t",row.names = FALSE)
  