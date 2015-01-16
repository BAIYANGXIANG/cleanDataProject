library(plyr)
library(reshape2)
# read to the data.frame about objects been tested
subject <- read.table(file = "./test/subject_test.txt")
# read into activities code
activity <- read.table(file = "./test/y_test.txt")
# read into activity labels
activitylabel <- read.table(file = "./activity_labels.txt")
# match the code with the label
labels <- join(activity,activitylabel,"V1")
labels <- as.data.frame(labels[,2])
# read the measure data
testData <- read.table("./test/X_test.txt",colClasses = "numeric",nrows = 2947)
#  build test dataset
testData <- cbind(subject,labels,testData)
names(testData)[1:2] <- c("subject","activity")


# read into training dataset
subjecttrain <- read.table(file = "./train/subject_train.txt")
activitytrain <- read.table(file = "./train/y_train.txt")
trainData <- read.table("./train/X_train.txt",colClasses = "numeric",nrows = 7352)
# match the activity code with name
labelstrain <- join(activitytrain,activitylabel,"V1")
labelstrain <- as.data.frame(labelstrain[,2])
trainData  <- cbind(subjecttrain,labelstrain,trainData)
names(trainData)[1:2] <- c("subject","activity")


# building dataset
Feature <- read.table(file = "./features.txt")
variables <- as.character(Feature[,2])
alldata <- rbind(testData,trainData)
colnames(alldata)[3:563] <- variables

# make changes to the names to make it tidy and extract the right columns
colnum <- grep("mean|std",names(alldata))
finaldata <- cbind(alldata[,1:2],alldata[,colnum])
names(finaldata) <- gsub("\\()","",names(finaldata))
finaldata[,1] <- as.factor(finaldata[,1])

# melt the data
meltvariable <- colnames(finaldata)[3:81]
finaldataMelt <- melt(finaldata,id=c("subject","activity"),measure.vars = meltvariable)
finaldataMelt_mean <- dcast(finaldataMelt,subject*activity~variable,mean)
finaldataMelt_mean <- melt(finaldataMelt_mean,id=c("subject","activity"),
                           measure.vars = meltvariable)

write.table(finaldataMelt_mean,file = "tidydata.txt",row.names = F,sep = " ")












