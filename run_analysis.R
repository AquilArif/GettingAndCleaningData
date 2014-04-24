print("Script Started")

print("")

if(file.exists("UCI HAR Dataset")) {

	print("Reading Features from the file")
	featureHeader <- read.table("UCI HAR Dataset\\features.txt")
	featureHeaderDF <- data.frame(featureHeader)

	print("Reading Activity Labels from the file")
	activityLabels<- read.table("UCI HAR Dataset\\activity_labels.txt")
	activityLabelsDF <- data.frame(activityLabels)
	colnames(activityLabelsDF) <-  c("ActivityCode", "ActivityLabel")

	print("Reading data for Subjects in the Training Set")
	subjectsTrain <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

	print("Reading X Train values")
	xTrain <- read.table("UCI HAR Dataset\\train\\X_train.txt")

	print("Adding column names to X Train data set")
	colnames(xTrain) <- featureHeaderDF[,2]
	
	print("Reading Y Train values")
	yTrain <- read.table("UCI HAR Dataset\\train\\y_train.txt")

	print("Adding column names to Y Train data set")
	colnames(yTrain) <- c("ActivityCode")

	print("Adding Activity and Subject info to X Train data set")
	xTrain[,"ActivityCode"] <- yTrain[,1]
	xTrain[,"Subject"] <- subjectsTrain[,1]

	print("Extracting Relevant columns from the X Train data set")
	trainData <- xTrain[,c(grep("std()",colnames(xTrain)),grep("mean()",colnames(xTrain)),grep("ActivityCode",colnames(xTrain)),grep("Subject",colnames(xTrain)))]

	print("Reading data for Subjects in the Test Set")
	subjectsTest <- read.table("UCI HAR Dataset\\test\\subject_test.txt")

	print("Reading X Test values")
	xTest <- read.table("UCI HAR Dataset\\test\\X_test.txt")

	print("Adding column names to X Test data set")
	colnames(xTest) <- featureHeaderDF[,2]

	print("Reading Y Test values")
	yTest <- read.table("UCI HAR Dataset\\test\\y_test.txt")

	print("Adding column names to Y Test data set")
	colnames(yTest) <- c("ActivityCode")

	print("Adding Activity and Subject info to X Test data set")
	xTest[,"ActivityCode"] <- yTest[,1]
	xTest[,"Subject"] <- subjectsTest[,1]

	print("Extracting Relevant columns from the X Test data set")
	testData <- xTest[,c(grep("std()",colnames(xTest)),grep("mean()",colnames(xTest)),grep("ActivityCode",colnames(xTest)),grep("Subject",colnames(xTest)))]

	print("Combining Train and Test data")
	combinedData <- rbind(trainData,testData)

	print("Adding descriptive Activity labels")
	mergedData <- merge(combinedData,activityLabelsDF,by.x="ActivityCode",by.y="ActivityCode")

	print("Remove Activity Codes from the data set")
	mergedData$ActivityCode <- NULL

	print("Aggregate data by Subject and Activity")
	aggdata <- aggregate(mergedData, by=list(subject = mergedData$Subject,activityLabel = mergedData$ActivityLabel), FUN=mean, na.rm=TRUE)
	aggdata$Subject<- NULL
	aggdata$ActivityLabel<- NULL

	print("Writing Tidy Data to output file")
	write.table(aggdata,"TidyData.csv",sep=",",row.names=FALSE)
	write.table(aggdata,"TidyData.txt",sep="\t",row.names=FALSE)

	print("The Tidy Data can be found in TidyData.csv and TidyData.txt in the current folder")

} else {

	print("Folder with name UCI HAR Dataset not found. To run this script all data must be present under this folder. The folder structure should also be maintained as is.")

}

print("Script Executed Successfully ... Thanks for your Patience :-) ")
