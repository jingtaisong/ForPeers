# Document purpose
Readme file to accompany the Human Activity Recognition Using Smartphones study in the context of a coursera assignement.
Version 1.0

# Contact information
{myname}, {mycontactinfo}

For more info about this dataset contact: {mycontactinfo}

For more info about the original dataset contact: activityrecognition@smartlab.ws

# Historic
The dada and codebook for this subset were extracted by {myname}, {mycontactinfo}, 
from the material provided by SmartLab, one of the Research Laboratories at the DITEN 
Department of the University of Genova, www.smartlab.ws. The material was downloaded 
from the http://archive.ics.uci.edu/ml/about.html home page on the UCI world wide web 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
on June 8, 2014. For complete documentation please visit this web site.

# Summary of the original experiment done in 2012.
Human Activity Recognition database built from the recordings of 30 subjects 
performing activities of daily living (ADL) while carrying a waist-mounted smartphone 
with embedded inertial sensors. For complete documentation visit the ICU web site. 

# Goals of this study (done June 2014)
The main goal is to put into practice what we have learnt during the course, so to 
use concepts, functions, commands, libraries, not yet to interprete the data.
The first step is to create a first tidy dataset by extracting the mean and 
standard deviation measurements from the original dataset. 
The second step is to create a second tidy dataset and calculate the mean of each mean and standard deviation measurements for each subject/activity.

# The dataset includes the following files
* on GitHub

 * README.md
 
 * Codebook.md
 
 * run_analysis.R
* on coursera project 

 * subjectactivitymean.txt: means of the means and means of the standard deviations per subject/activity.
* on peer workstation

 * The file, unzipped, downloaded from this website page: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Notes context of the assignment
Please submit a link to a Github repo with the code for performing your analysis. The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory. The output should be the tidy data set you submitted for part 1. You should include a README.md in the repo describing how the script works. 


1 In the original dataset some variables do not follow the naming convention 
  described in the features_info.txt file. For example sometimes the word "Body" 
  appears two times in the name. For a real analysis (not a course assignment) I 
  would contact the data provider and agree on name changes or spend time on each 
  variable to understand the calculation and rename the variable accordingly. 
  However for the assignment I keept the names as is so that, in case data have to 
  be reconciled it will be feasible.
2 In the feature_info.txt file I would add a section to explain the new variable
  calculation for each mean of each mean, standard deviation per subject activity
3 In the feature.txt file I would add the additionnal id/desc for the new variable.

# Data processes for the file subjectactivitymean.txt

![image from saswindy](https://github.com/saswindy/ForPeers/CodeSummary.jpg)

1. upload the needed files.
2. column-combine the "train" files all together in this order: variable subject activity. This order facilitate the usage of indexes. The same process is used for the "test" files.
3. row-combine the sets obtained in step 2 train first, test at the end.
4. upload the features file
5. in the features table find the row number of each variable having the statistical estimate mean() and std() and keep this information into an index.
  * Note1: the statistical estimate meanfreq() is not considered for this study.
  * Note2: the additionnal vector (gravityMean, tBodyAccMean, tBodyAccJerkMean, 
tBodyGyroMean, tBodyGyroJerkMean) are not considered for this study.
6. from the features files, based on the index obtain at step 5, extract only the variable descriptions we want to work with.
  * Note1: A typo was found in some variable names, the same for each of them: the word Body appeared two times: BodyBody. After underdanding the standard used in the original dataset and checking that changing the typo had no bad impacts on the data but add more consistencies, the correction was applied.  For reference these are the original variables that were changed: fBodyBodyAccJerkMag-mean(), fBodyBodyAccJerkMag-std(), fBodyBodyGyroMag-mean(), fBodyBodyGyroMag-std(), fBodyBodyGyroJerkMag-mean(), fBodyBodyGyroJerkMag-std()
7. Clean the variable descriptions by removing all special characters: - ( ) that way it is easier to type the name of the variable, it also allows to make direct operations using var names. (ie: aa - bb, it would be tricky to have a-a -bb).
8. Create the new variable names by using MeanOfMean and MeanOfStd and add the future column title for the subject and activity.
  * Note1: The new variable are build based on the existing standard but with the addition of a camelcase standard. See the codebook section "Variables descriptions coming from the original dataset".
  * Note2: these variables should also be added to the features.txt files with new unique integer identifiers. (not done in the context of the assignement)
  * Note3: these new means of means and means of standard deviations per subject/activity should also be added in the features_info.txt file. (not done in the context of the assignment)
9. to ensure the two last columns (subject and activity) of the table obtain at step 3 are kept their respective index has to be added to the index. 
10. Filter, based on the index, the table obtained at step 3 to keep only the columns we want to work with.
11. arrange the table obtained at step 10 to get this order: Subject, Activity, all measurements.
12. groupe this information per subject/activity and calculate the mean for each estimate. 
  * Note1: at this stage the table is also ordered to ensure each subject/activity appears in the right order.
13. This step is optional but as a user I do not like to only work with identifiers, I like to see at first glance the meaning of a variable. So for the subject, I generated fictive subject names.
14. load the Activity_labels file
15. clean the description to met the general standards (CamelCase and no special characters)
16. Match the subject identifiers between the two tables. Same process with the activity identifiers.
17. in the main table, based on the match index generated at step 16, next to the subject identifier add a column with the subject generated names. Same process for the activities.
18. give a name to each column using the information created at step 8
19. create a file in the directory UCI HAR Dataset/named subjectactivitymean.txt
  * Note1: this file can be read using read.table(file = "UCI HAR Dataset/subjectactivitymean.txt" header = TRUE)

# Reasons why this dataset is a tidy dataset
  * Each calculated variable is in a column with a unique identifier.
  * Each observation (we want it by subject/activity) is in a different row.
  * There is one table of the subset of variable we are asked to work on.
  * We are working with multiple tables: they all have a common unique identifier so that info can be linked together. 
  * Each file has a title for each column.
  * A standard is defined and is met by each piece of information.

# License
Use of the original dataset in publications must be acknowledged by referencing the 
following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012 This dataset is distributed AS-IS and no responsibility 
implied or explicit can be addressed to the authors or their institutions for its use 
or misuse. Any commercial use is prohibited. Jorge L. Reyes-Ortiz, Alessandro Ghio, 
Luca Oneto, Davide Anguita. November 2012.
