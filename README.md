Course project: Coursera -> Getting and Cleaning data
=======================================================

Introduction
------------
This repo has the code and the results for the coursera project on getting and cleaning data

About the raw data
------------------
The testing and the training datasets contains the following:

1) Unlabeled features (561 of them) stored in the x_test.txt. 
2) Activity labels stored in the y_test.txt file.
3) Subjects stored in the subject_test.txt file.

About the script and the tidy dataset
-------------------------------------
The script "run_analysis.R" merges the test and training sets together.
Before the script runs, the working directory has to be se where the extracted .zip files are stored

Only labeled columns containing information about mean and standard deviation after merging the training and testing datasets are stored. 

Script creates a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.

