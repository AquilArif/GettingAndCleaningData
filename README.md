GettingAndCleaningData
======================

Repository for my Getting And Cleaning Data MOOC on Coursera by Prof. Jeff Leeks
-------------------------------------------

How to run the analysis?
1. Ensure that the file run_analysis.R and the data folder ("UCI HAR Dataset") are in the same folder
2. Ensure no changes have been made to the folder structure 
3. Set the current directory to the folder with the R script and the data
4. Run the code
Note: MAC users may need to update folder path in the script. I am not sure since I own a Windows PC but prof. Leeks mentioned it in one of his lectures.

File Execution:
The file prints output on the console after each step executes. Hopefully it would give you enough information on how i have processed the data.

Output:
On successful execution there should be two files TidyData.csv and TidyData.txt in the folder with the R script

What the script does?
1. Check if the data folder exists, if yes continue further, otherwise print user message
2. Read the data from the files and load them into R
2. The data set do no have columns and hence the script adds it wherever necessary
3. After loading the X Train data from the files, the subject and activity codes are added to this dataset
4. The script extracts the required columns from the dataset obtained in step 3 (The columns with the means and std deviation values)
5. Similarly The Test data is also prepared (using step 3 & 4)
6. The Test & Train data is then combined 
7. The Activity codes are replaced with descriptive labels
8. Data is grouped by Subject & Activity Labels
9. The tidy data so obtained is written into the output files
 


