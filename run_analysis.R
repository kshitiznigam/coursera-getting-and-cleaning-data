if(!file.exists("C:/Users/User/Documents/data3")){dir.create("C:/Users/User/Documents/data3")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "C:/Users/User/Documents/data3/Dataset.zip")
unzip(zipfile = "C:/Users/User/Documents/data3/Dataset.zip",exdir = C:/Users/User/Documents/data3)
unzip(zipfile = "C:/Users/User/Documents/data3/Dataset.zip",exdir = "C:/Users/User/Documents/data3")
path_rf <- file.path("C:/Users/User/Documents/data3","UCI HAR Dataset")
files<-list.files(path_rf, recursive = TRUE)
files
dataActivityTest <- read.table(file.path(path_rf, "test" , "Y_test.txt"),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest <- read.table(file.path(path_rf, "test", "subject_test.txt"), header = FALSE)
dataFeatureTest <- read.table(file.path(path_rf, "test", "X_test.txt"), header = FALSE)
dataFeatureTrain <- read.table(file.path(path_rf, "train", "X_train.txt"), header = FALSE)
str(dataActivityTest)
str(dataActivityTrain)
str(dataSubjectTrain)
str(dataSubjectTest)
str(dataFeatureTest)
str(dataFeatureTrain)
dataSubject <- rbind(dataSubjectTrain
                     , dataSubjectTest)
dataActivity <- rbind(dataActivityTrain, dataActivityTest)
dataFeature <- rbind(dataFeatureTrain, dataf)
dataFeature <- rbind(dataFeatureTrain, dataFeatureTest)
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"), head=FALSE)
names(dataFeature) <- dataFeaturesNames$V2
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeature, dataCombine)
subdataFeaturesNames<-dataF
subdataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedNames <- c(as.character(subdataFeaturesNames), "subject", "activity")
Data<-subset(Data,select = selectedNames)
str(Data)
activityLabels <- read.table(file.path(path_rf, "acttivity_labels.txt"), header = FALSE)
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"), header = FALSE)
head(Data$activity)
head(Data$activity,30)
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("^Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data)
)
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)
library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity) ,]
write.table(Data2, file = "tidydata.txt", row.name=FALSE)

