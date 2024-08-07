# Bash Script Task A
## This task is required to organize files in a directory based on the file type.
### The script take the required directory path as an argument and itterate over all files inside it and acourding to the file extention the script create a subdirectory and move the file to it.
## * The script contain six functions:
#### (1) GetExtention ----> It take the file as an argument and extract its extention.
#### (2) Move2txt ----> If the file extention is .txt we call this function that create a txt subdirectory if not already exist then move this file to it. 
#### (3) Move2jpg ----> If the file extention is .jpg we call this function that create a jpg subdirectory if not already exist then move this file to it. 
#### (4) Move2pdf ----> If the file extention is .pdf we call this function that create a pdf subdirectory if not already exist then move this file to it. 
#### (5) Move2misc ----> For any other case like no extention or unkown extention and hidden files we call this function that create a misc subdirectory if not already exist then move this file to it. 
#### (6) Move2txt ----> If the file extention is .txt we call this function that create a txt subdirectory if not already exist then move this file to it. 
