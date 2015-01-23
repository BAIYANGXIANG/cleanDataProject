## Getting and Cleaning Data Course Project

This is a introduction for how run.analysis.R to retrieve data and make it tidy



### Before running the code

Please download the zip fire from project page and put the analysis.R under

directory __./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset__



### read data from test
 
```
library(plyr)
library(reshape2)
subject <- read.table(file = "./test/subject_test.txt")
activity <- read.table(file = "./test/y_test.txt")

```




### Give the activity real name
```
activitylabel <- read.table(file = "./activity_labels.txt")
labels <- join(activity,activitylabel,"V1")
labels <- as.data.frame(labels[,2])

```


### Building test dataset

Column conbine the test data, subject, activity accordingly

```
testData <- read.table("./test/X_test.txt",colClasses = "numeric",nrows = 2947)
testData <- cbind(subject,labels,testData)
names(testData)[1:2] <- c("subject","activity")

```


### Building train dataset

The processes are the same

```
subjecttrain <- read.table(file = "./train/subject_train.txt")
activitytrain <- read.table(file = "./train/y_train.txt")
trainData <- read.table("./train/X_train.txt",colClasses = "numeric",nrows = 7352)
labelstrain <- join(activitytrain,activitylabel,"V1")
labelstrain <- as.data.frame(labelstrain[,2])
trainData  <- cbind(subjecttrain,labelstrain,trainData)
names(trainData)[1:2] <- c("subject","activity")
```


### Combine test and train dataset together

The two dataset both have 563 variables, so we can use rbind function to bind

them together. Then we can read the feature file to get the actual measurement.

Use colnames() to give descriptive variable names.

```
Feature <- read.table(file = "./features.txt")
variables <- as.character(Feature[,2])
alldata <- rbind(testData,trainData)
colnames(alldata)[3:563] <- variables

```


### Tidy data

Use grep funtion to extract the columns with names including "mean""std".
Examine the variable name. I kept the upper case and "-" because they make the 
name easy to read.
I use the gsub to delete "()" in the names because it is useless.
Also, change the subject(int) to a factor variable

```
colnum <- grep("mean|std",names(alldata))
finaldata <- cbind(alldata[,1:2],alldata[,colnum])
names(finaldata) <- gsub("\\()","",names(finaldata))
finaldata[,1] <- as.factor(finaldata[,1])
```

### Reshape the dataset

First use melt function to transform all features into single variable
This structure is easy to do data analysis.
Using decast to calculate the mean of features about each activity and each subject

```
meltvariable <- colnames(finaldata)[3:81]
finaldataMelt <- melt(finaldata,id=c("subject","activity"),measure.vars = meltvariable)
finaldataMelt_mean <- dcast(finaldataMelt,subject*activity~variable,mean)
finaldataMelt_mean <- melt(finaldataMelt_mean,id=c("subject","activity"),measure.vars = meltvariable)
```

### write data to txt

```
write.table(finaldataMelt_mean,file = "tidydata.txt",row.names = F,sep = " ")
```
                         