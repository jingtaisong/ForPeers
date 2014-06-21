# Codebook 

This codebook is written for the Human Activity Recognition Using Smartphones study in the context of a Coursera assignment.

It is composed of 3 sections:

1. Data dictionary
2. Standards
3. Notes

## Data dictionary 

Variable | Type | Unit | Description
--- | --- | --- | ---
ActivitId | integer | NA | Unique identifier for the activity. |
||1..6||(linked to ActivityDesc).
|
ActivityDesc| character |NA|  Description of the activities done by the subjects. |
||||(linked to ActivityId).
||Walking|| 1
||WalkingUpstairs||2
||WalkingDownstairs||3
||Sitting||4
||Standing||5
||Laying||6
|
FeatureId| integer | NA | Unique identifier for variable of the feature vector (in the context of the assignement only the new ones created are defined here, see the origial document to see the ones that already existe). |
||||(linked to SignalDesc).
||562...627 
|
FeaturesDesc| character |NA| Description of the feature vector (in the context of the assignement only the new ones created are defined here, see the origial document to see the ones that already existe). Note: there is no unit for these variables because they were divided by their respective range to be normalized.|
||||(linked to SignalId).
| |	tBodyAccMeanOfMeanX	|	|	562
|	|	tBodyAccMeanOfMeanY	|	|	563
|	|	tBodyAccMeanOfMeanZ	|	|	564
|	|	tBodyAccMeanOfStdX	|	|	565
|	|	tBodyAccMeanOfStdY	|	|	566
|	|	tBodyAccMeanOfStdZ	|	|	567
|	|	tGravityAccMeanOfMeanX	|	|	568
|	|	tGravityAccMeanOfMeanY	|	|	569
|	|	tGravityAccMeanOfMeanZ	|	|	570
|	|	tGravityAccMeanOfStdX	|	|	571
|	|	tGravityAccMeanOfStdY	|	|	572
|	|	tGravityAccMeanOfStdZ	|	|	573
|	|	tBodyAccJerkMeanOfMeanX	|	|	574
|	|	tBodyAccJerkMeanOfMeanY	|	|	575
|	|	tBodyAccJerkMeanOfMeanZ	|	|	576
|	|	tBodyAccJerkMeanOfStdX	|	|	577
|	|	tBodyAccJerkMeanOfStdY	|	|	578
|	|	tBodyAccJerkMeanOfStdZ	|	|	579
|	|	tBodyGyroMeanOfMeanX	|	|	580
|	|	tBodyGyroMeanOfMeanY	|	|	581
|	|	tBodyGyroMeanOfMeanZ	|	|	582
|	|	tBodyGyroMeanOfStdX	|	|	583
|	|	tBodyGyroMeanOfStdY	|	|	584
|	|	tBodyGyroMeanOfStdZ	|	|	585
|	|	tBodyGyroJerkMeanOfMeanX	|	|	586
|	|	tBodyGyroJerkMeanOfMeanY	|	|	587
|	|	tBodyGyroJerkMeanOfMeanZ	|	|	588
|	|	tBodyGyroJerkMeanOfStdX	|	|	589
|	|	tBodyGyroJerkMeanOfStdY	|	|	590
|	|	tBodyGyroJerkMeanOfStdZ	|	|	591
|	|	tBodyAccMagMeanOfMean	|	|	592
|	|	tBodyAccMagMeanOfStd	|	|	593
|	|	tGravityAccMagMeanOfMean	|	|	594
|	|	tGravityAccMagMeanOfStd	|	|	595
|	|	tBodyAccJerkMagMeanOfMean	|	|	596
|	|	tBodyAccJerkMagMeanOfStd	|	|	597
|	|	tBodyGyroMagMeanOfMean	|	|	598
|	|	tBodyGyroMagMeanOfStd	|	|	599
|	|	tBodyGyroJerkMagMeanOfMean	|	|	600
|	|	tBodyGyroJerkMagMeanOfStd	|	|	601
|	|	fBodyAccMeanOfMeanX	|	|	602
|	|	fBodyAccMeanOfMeanY	|	|	603
|	|	fBodyAccMeanOfMeanZ	|	|	604
|	|	fBodyAccMeanOfStdX	|	|	605
|	|	fBodyAccMeanOfStdY	|	|	606
|	|	fBodyAccMeanOfStdZ	|	|	607
|	|	fBodyAccJerkMeanOfMeanX	|	|	608
|	|	fBodyAccJerkMeanOfMeanY	|	|	609
|	|	fBodyAccJerkMeanOfMeanZ	|	|	610
|	|	fBodyAccJerkMeanOfStdX	|	|	611
|	|	fBodyAccJerkMeanOfStdY	|	|	612
|	|	fBodyAccJerkMeanOfStdZ	|	|	613
|	|	fBodyGyroMeanOfMeanX	|	|	614
|	|	fBodyGyroMeanOfMeanY	|	|	615
|	|	fBodyGyroMeanOfMeanZ	|	|	616
|	|	fBodyGyroMeanOfStdX	|	|	617
|	|	fBodyGyroMeanOfStdY	|	|	618
|	|	fBodyGyroMeanOfStdZ	|	|	619
|	|	fBodyAccMagMeanOfMean	|	|	620
|	|	fBodyAccMagMeanOfStd	|	|	621
|	|	fBodyAccJerkMagMeanOfMean	|	|	622
|	|	fBodyAccJerkMagMeanOfStd	|	|	623
|	|	fBodyGyroMagMeanOfMean	|	|	624
|	|	fBodyGyroMagMeanOfStd	|	|	625
|	|	fBodyGyroJerkMagMeanOfMean	|	|	626
|	|	fBodyGyroJerkMagMeanOfStd	|	|	627
|
EstimateDesc| character |NA| Description for the statistical operation
||||(no need to have unique id in this case the description is a sufficient identifier)
||Mean
||Std
||MeanOfMean
||MeanOfStd
|
SujectId| integer |NA| Unique identifier for the subject  
|||| (linked to SubjectDesc)
|| 1..30
|
SubjectDesc| character |NA| Fictive generated name to describe each subject|
|||| (linked to SubjectId)
||Subject[1..30]||[1..30]

## Standards
### Variables names (general)
Variable names were build meeting the following standards:
* CamelCase because it is easy to read, is processed by 100% of the applications that might upload this set of data and is not too complicated for the user to quickly type them.
* Special characters and spaces are not used because they can cause some issues during the upload in some applications. It is also risky to use special characters in a statistical environment where a lot of operations are done. (ie: substracting  aa - bb or a-a - bb can provide errors or/and worst data inconsistancies because not calculated correctly).
* Length of the variable should not be too long so that they are quickly typed when doing an analysis, and so contractions can be used when they are intuitive. (ie: gyro is easy to know that it stands for gyroscope).

### Variables descriptions (general)
* Because variable descriptions can in some cases be used as column names they are following the same standards as the variable names.
* An additional column could be added (LongDescription) to be used in reports for the reading to be more "normal". 

### Variables descriptions coming from the original dataset

Specific information regarding the conventions used in the original dataset and that are kept in this tidy dataset.  There is 7 positions used to build the variable name. Examples can be found in the table below. It is important to respect the order but when concatenating the names a position can be empty. The estimate is always added before the coordinate when it exists. Information provided here define the standard, information about the meaning is defined in the Features_info.txt file. In the context of the assignment two new estimantes were calculated for each subject/activity/variable: the "mean of mean"" and the "mean of the standartd deviation". The shortname chosen is MeanOfMean and MeanOfStd.    

Variable | Code1 | Code2 | Code3 | Code4 | Code5 | Estimate | Code7
--- | --- | --- | --- | --- | --- | --- | ---
tBodyAccX| t| Body| Acc| | || X
tGravityAccstdY|	t| Gravity| Acc| | |std| Y
tBodyAccJerkmeanX| t| Body| Acc| Jerk| |mean| X
tBodyGyroX| t	| Body| Gyro| | ||  X
fBodyGyroJerkX| f| Body| Gyro| Jerk| || Z
tBodyAccMag| t| Body| Acc| | Mag	
tGravityAccMag| t| Gravity| Acc| | Mag	
tBodyAccJerkMag| t| Body| Acc| Jerk| Mag
|
|
Examples of new variable names in the context of the assignement||||
tGravityAccMeanOfMeanY|  t| Gravity| Acc| | |MeanOfMean| Y
tGravityAccYMeanOfStdY|  t| Gravity| Acc| | |MeanOfStd| Y


## Notes
* There were no missing data in the original set provided.
* A typo was found in some variable names, the same for each of them: the word Body appeared two times: BodyBody. After underdanding the standard used in the original dataset and checking that changing the typo had no bad impacts on the data but add more consistencies, the correction was applied.
* For reference these are the original variables that were changed:
    * fBodyBodyAccJerkMag-mean()
    * fBodyBodyAccJerkMag-std()
    * fBodyBodyGyroMag-mean()
    * fBodyBodyGyroMag-std()
    * fBodyBodyGyroJerkMag-mean()
    * fBodyBodyGyroJerkMag-std()
* In the features.txt file, variable names are in fact composed using two types of information: the signal and the statistical operation. To met the tidy data definition, (variable should define a single information), the variable was split into two different variables(signal + statistical operation). In fact, by doing this the variable that I come up with are exactly the variable described in the feature_info.txt file.
* Finally for more detail see the readme file

