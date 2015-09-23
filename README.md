### Getting and Cleaning Data: Course Project

This repository contains a set of scripts for execution of Project Course (Getting and Clearing Data).

Files:
- README.md - current file
- CodeBook.md - Code Book of this project, describes all the variables used, data, transformations and so on.
- run_analysis.R - This script performs all the transformations.
- GetData.R - Script downloads the data set from web-site and un-zips it in current directory 

### How to get tided data 

1. Run GetData.R script. This script will download archieve https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , extract it into current directory. Therefor now we have folder "UCI HAR Dataset" in current directory created.
2. Run run_analysis.R script. This script will load load two datasets (train and test) into memory, merge them, select necessaty columns and form tided data.

If you have already downloaded archieve from WEB-site you can skip step 1 and just run run_analysis.R script.








