## Read in the data files and titles

## Source required librarys
library(qdap)

## Read in the label file
setwd("~/Work/R Programming/Prog Assign 4/Samsung data/UCI HAR Dataset")
labels<-read.table("features.txt")

## Read in activity label file
setwd("~/Work/R Programming/Prog Assign 4/Samsung data/UCI HAR Dataset")
act.name<-read.fwf(file="activity_labels.txt",width=c(1,-1,20))

## Read in the test file
message("Reading test file")
setwd("~/Work/R Programming/Prog Assign 4/Samsung data/UCI HAR Dataset/test")
test.file<-read.fwf(file = "X_test.txt", width = c(rep(16,561)))
names(test.file)<-labels[,2]
act.filetst<-read.fwf(file = "y_test.txt", width = 1)
act.filetstN<-apply(act.filetst,2,lookup,act.name)
act.filetstN<-as.data.frame(sapply(act.filetstN,function(x) gsub("\"","",x)))
names(act.filetstN)<-c("Activity")
test.file<-cbind(file = "test",act.filetstN,test.file)

## Read in train file
message("Reading train file")
setwd("~/Work/R Programming/Prog Assign 4/Samsung data/UCI HAR Dataset/train")
train.file<-read.fwf(file = "X_train.txt", width = c(rep(16,561)))
names(train.file)<-labels[,2]
act.filetrn<-read.fwf(file = "y_train.txt", width = 1)
act.filetrnN<-apply(act.filetrn,2,lookup,act.name)
act.filetrnN<-as.data.frame(sapply(act.filetrnN,function(x) gsub("\"","",x)))
names(act.filetrnN)<-c("Activity")
train.file<-cbind(file = "train",act.filetrnN,train.file)

## Read in the column file
setwd("~/Work/R Programming/Prog Assign 4/Samsung data/UCI HAR Dataset")
column.file<-read.csv("column.csv")

## combine the two files
message("combining file")
total.file<- rbind(test.file,train.file)

## extract mean and std columns
message("Extracting mean and std")
tidy_data<-data.frame(File=character(0),Name=character(0),Mean=numeric(0),STD=numeric(0))
for (i in 1:nrow(column.file)){
        tempF<-total.file[,c(1:2,column.file$Mean[i],column.file$STD[i])]
        tempN<-column.file[i,2]
        holdf<-cbind(tempF[,1:2],tempN,tempF[,c(3,4)])
        names(holdf)<-c("File","Activity","Name","Mean","STD")
        tidy_data<-rbind(tidy_data,holdf)
        
}
## Creating tidy set
message("Creating tidy data set")
tidy_data2<-aggregate(tidy_data[,4:5],list(tidy_data$Activity,tidy_data$Name),data=tidy_data,FUN=mean)
setwd("~/Work/R Programming")
names(tidy_data2)<c("Activity", "Name","Mean","STD")
## tidy_data2
write.table(tidy_data2,"tidy_data_set.txt",row.name=FALSE,col.name=FALSE)