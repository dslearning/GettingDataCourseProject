#Getting & Cleaning data course project

#Loading libraries HTTR (to download file from WEB) 
library(httr)


#downloading archieve
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "project.zip")

# ..and extracting it
unzip("project.zip", overwrite=TRUE)
