## Code book 

### The measurements we need
The features selected for this database come from the accelerometer and 
gyroscope  3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These time domain signals (prefix 't' to denote time) were captured at a 
constant rate of 50 Hz. 

Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass 
Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the 
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

We then extract the column indicating the measurements of mean and std

These are the 79 meanmeasurements regarding the mean and std
```
[1] "tBodyAcc-mean-X"               "tBodyAcc-mean-Y"               "tBodyAcc-mean-Z"              
[4] "tBodyAcc-std-X"                "tBodyAcc-std-Y"                "tBodyAcc-std-Z"               
[7] "tGravityAcc-mean-X"            "tGravityAcc-mean-Y"            "tGravityAcc-mean-Z"           
[10] "tGravityAcc-std-X"             "tGravityAcc-std-Y"             "tGravityAcc-std-Z"            
[13] "tBodyAccJerk-mean-X"           "tBodyAccJerk-mean-Y"           "tBodyAccJerk-mean-Z"          
[16] "tBodyAccJerk-std-X"            "tBodyAccJerk-std-Y"            "tBodyAccJerk-std-Z"           
[19] "tBodyGyro-mean-X"              "tBodyGyro-mean-Y"              "tBodyGyro-mean-Z"             
[22] "tBodyGyro-std-X"               "tBodyGyro-std-Y"               "tBodyGyro-std-Z"              
[25] "tBodyGyroJerk-mean-X"          "tBodyGyroJerk-mean-Y"          "tBodyGyroJerk-mean-Z"         
[28] "tBodyGyroJerk-std-X"           "tBodyGyroJerk-std-Y"           "tBodyGyroJerk-std-Z"          
[31] "tBodyAccMag-mean"              "tBodyAccMag-std"               "tGravityAccMag-mean"          
[34] "tGravityAccMag-std"            "tBodyAccJerkMag-mean"          "tBodyAccJerkMag-std"          
[37] "tBodyGyroMag-mean"             "tBodyGyroMag-std"              "tBodyGyroJerkMag-mean"        
[40] "tBodyGyroJerkMag-std"          "fBodyAcc-mean-X"               "fBodyAcc-mean-Y"              
[43] "fBodyAcc-mean-Z"               "fBodyAcc-std-X"                "fBodyAcc-std-Y"               
[46] "fBodyAcc-std-Z"                "fBodyAcc-meanFreq-X"           "fBodyAcc-meanFreq-Y"          
[49] "fBodyAcc-meanFreq-Z"           "fBodyAccJerk-mean-X"           "fBodyAccJerk-mean-Y"          
[52] "fBodyAccJerk-mean-Z"           "fBodyAccJerk-std-X"            "fBodyAccJerk-std-Y"           
[55] "fBodyAccJerk-std-Z"            "fBodyAccJerk-meanFreq-X"       "fBodyAccJerk-meanFreq-Y"      
[58] "fBodyAccJerk-meanFreq-Z"       "fBodyGyro-mean-X"              "fBodyGyro-mean-Y"             
[61] "fBodyGyro-mean-Z"              "fBodyGyro-std-X"               "fBodyGyro-std-Y"              
[64] "fBodyGyro-std-Z"               "fBodyGyro-meanFreq-X"          "fBodyGyro-meanFreq-Y"         
[67] "fBodyGyro-meanFreq-Z"          "fBodyAccMag-mean"              "fBodyAccMag-std"              
[70] "fBodyAccMag-meanFreq"          "fBodyBodyAccJerkMag-mean"      "fBodyBodyAccJerkMag-std"      
[73] "fBodyBodyAccJerkMag-meanFreq"  "fBodyBodyGyroMag-mean"         "fBodyBodyGyroMag-std"         
[76] "fBodyBodyGyroMag-meanFreq"     "fBodyBodyGyroJerkMag-mean"     "fBodyBodyGyroJerkMag-std"     
[79] "fBodyBodyGyroJerkMag-meanFreq"
```

### Structure of tidy data

* Subject

content: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17...30

Instruction: all 30 people who took part in the experiment

* Activity

content:WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING

* Variable

content: the mean of 79 measurements mentioned above

* Value


