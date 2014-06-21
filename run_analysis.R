#Second data set  
#Item5 - Creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.
#########1#########2#########3#########4#########5#########6#########7##########
require(stringr)

  #5-1 - Upload an merge the training test and subject sets into one data set
  #######1#########2#########3#########4#########5#########6#########7##########

  TrainA <- read.table("UCI HAR Dataset/train/Y_train.txt")
  TrainS <- read.table("UCI HAR Dataset/train/subject_train.txt")
  TrainM <- read.table("UCI HAR Dataset/train/X_train.txt")
  TestA  <- read.table("UCI HAR Dataset/test/Y_test.txt")
  TestS  <- read.table("UCI HAR Dataset/test/subject_test.txt")
  TestM  <- read.table("UCI HAR Dataset/test/X_test.txt")
  
  #combine in this order: Measurements/Subject/Activity the Train/Test
  #it is easier to manage the indexes keeping this order. Table will be 
  #arrange in the right oder Subject/Atovity/Measurements later on.
  TrainAll <- cbind(TrainM,TrainS,TrainA)
  TestAll  <- cbind(TestM,TestS,TestA)
  TrainTestAll <- rbind(TrainAll,TestAll)

  #clean memory 
  remove(TrainA, TrainS, TrainM, TestA, TestS, TestM, TrainAll, TestAll)


  #5-2 - Extracts only the measurements on the mean and standard deviation for 
  #        each measurement
  #######1#########2#########3#########4#########5#########6#########7##########
  
  #get indexes only for measurements with statistical mean() and std() not meanFreq()
  Features <- read.table("UCI HAR Dataset/features.txt")
  index_features <- grep("mean\\()|std\\()", Features$V2)

  #keep only the feature labels of the features we want to work with
  Features <- subset(Features,Features$V1 %in% index_features)

  #clean measurement strings - clean special characters
  Features$V2 <- gsub("\\-|\\(|\\)", "", Features$V2)

  #clean measurement strings - replace BodyBody with Body.
  Features$V2 <- str_replace(Features$V2, "BodyBody", "Body")
 
  #Verify that there is no duplicate - OK
  #nrow(unique(Features)) 

  #Create future row titles with new unique variable names: add MeanOf in the 
  #existing variable names. Add also the title for the subject and activity.
  #This info should also be added in feature.txt and feature_info.txt but this
  #is not part of the assignment.

  FutureVarNames <- Features$V2  
  FutureVarNames <- gsub("mean", "MeanOfMean", FutureVarNames, perl=TRUE)
  FutureVarNames <- gsub("std", "MeanOfStd", FutureVarNames, perl=TRUE)
  FutureVarNames <- c("SubjectId", "SubjectDesc", "ActivityId", "ActivityDesc",
                      FutureVarNames)
  #extract only information we want to work with
  # TrainTestAll already contains all infomration in this order Measurement/Subject/
  # Activity.  To ensure the two last columns are kept, their respecive index has 
  # to be added to the list of indexes corresponding the the rows we want to keep.
  index_tokeep <- c(index_features, ncol(TrainTestAll)-1, ncol(TrainTestAll)) 
  TrainTestAll <- TrainTestAll[,index_tokeep]    
  
  #order columns to get this info in the order of the observation
  #Subject/Activity/Measurement (so move the last to row at the beginning of the table)
  TrainTestAll <- cbind(TrainTestAll[(ncol(TrainTestAll)-1):ncol(TrainTestAll)], 
                       TrainTestAll[1:(ncol(TrainTestAll)-2)])

  #observation: group information by subject(col1) and activity(col2).  
  #and for each observation calculate the mean
  TrainTestAll <- aggregate(TrainTestAll[,-c(1,2)], 
                            by = list(TrainTestAll[,1],TrainTestAll[,2]),
                            FUN = "mean")
  
  #order rows by subject (Group1) and activity (Groupe2)  
  TrainTestAll <- TrainTestAll[order(TrainTestAll$Group.1, TrainTestAll2$Group.2),]

  #clear memory
  remove(Features, index_features, index_tokeep)

  #5-3 - Use descriptive activity names to name the activities in the data set.
  #        meaning: Use the activity descriptions/labels not only activity ids.
  #      I also decided to generate fictive names for each subject because even
  #        if we want them to be kept anonymous it is easier to know what the 
  #        information is about.
  #######1#########2#########3#########4#########5#########6#########7##########

  #generate text to describe subjects instead of using only ids
  SubjectDesc <- vector()
  SubjectId <- vector() 
  index_subject <- 1
  for (index_subject in 1:30 ) {
     SubjectId[index_subject] <- index_subject
     SubjectDesc[index_subject] <- paste("Subject", index_subject, sep = "")
  }#end for
  SubjectId<- data.frame(SubjectId)
  SubjectDesc <- data.frame(SubjectDesc)
  Subject <- cbind(SubjectId, SubjectDesc)
  
  #load activity labels and match the codes to get the indexes
  ActyLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
  ActyLabels$V2 <- tolower(ActyLabels$V2)
  ActyLabels$V2 <- gsub("(^|\\_)([[:alpha:]])", "\\1\\U\\2", ActyLabels$V2, perl=TRUE)
  ActyLabels$V2 <- gsub("\\_","",ActyLabels$V2)

  #clean memory 
  remove(SubjectId, SubjectDesc, index_subject)

  #for Subject and Activity match the identifier found in the Group columns
  #with the identifier found in the table
  MatchIdxSubject   <- match(TrainTestAll[,"Group.1"], Subject$SubjectId)
  MatchIdxActivity  <- match(TrainTestAll[,"Group.2"], ActyLabels$V1)

  #add subject labels
  TrainTestAll <- cbind(TrainTestAll[1],
                     data.frame(Subject[MatchIdxSubject,"SubjectDesc"]),
                     TrainTestAll[2:ncol(TrainTestAll)])
  #add activity labels 
  TrainTestAll <- cbind(TrainTestAll[1:3],
                     data.frame(ActyLabels[MatchIdxActivity,"V2"]),
                     TrainTestAll[4:ncol(TrainTestAll)])

  #5-4 - Appropriately labels the data set with descriptive activity names.
  #      meaning: give a title to each column 
  #######1#########2#########3#########4#########5#########6#########7##########
  colnames(TrainTestAll) <- FutureVarNames

  #clean memory 
  remove(ActyLabels, FutureVarNames, MatchIdxSubject, MatchIdxActivity, Subject)
  
  # 5-5 As a final step create the text file
  #     read.table(file = "UCI HAR Dataset/subjectactivitymean.txt", header = TRUE)
  #######1#########2#########3#########4#########5#########6#########7##########
  write.table(TrainTestAll, file = "UCI HAR Dataset/subjectactivitymean.txt", 
              row.names = FALSE,
              col.names = TRUE,
              quote = FALSE)

 #clean memory 
 remove(TrainTestAll)
