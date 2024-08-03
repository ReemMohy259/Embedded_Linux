#! /usr/bin/bash

################################################## Script Information #######################################################
# Discreption; ----> This scripts aims to clean a directory by removing all files that older than a certain number of days\ 
# and has a dry run option that only list these files without deleting them.
# Inputs: ----> Take the option, directory path and the number of days as arguments.
# Outputs: ----> based on the option if the option is (--dry) will print the files that older than a certain number of days
#               but if the option is (-n) the script will give me a clean directory without any old files.
# Auther: ----> Reem Mohy Eldin.
############################################################################################################################# 

################################################# Script Parameters #########################################################
declare OPTION=$1
declare DIRPATH=$2
declare  DAYS=$3
############################################################################################################################# 

################################################### Script Logic ############################################################

# Check that only three arguments are based
if (( $# != 3 )); then
    echo "Error: Three arguments are required"
    exit 1
fi

# Check if the entered directory is exist or not
if [ ! -d "${DIRPATH}" ]; then
    echo "Error: Directory \"${DIRPATH}\" not exists"
    exit 1
fi

# Check for the number of days to be valid integer
if ! [[ ("${DAYS}" =~ ^-?[0-9]+$) && ("${DAYS}" -ge 0) ]]; then
    echo "Error: Invalid number of days"
    exit 1
fi

# Check for the option entered
if [[ "${OPTION}" == "--dry" ]]; then  
    echo "Dry run mode: The following files would be deleted"
    find "$DIRPATH" -type f -mtime +"$DAYS"   

    elif [[ "${OPTION}" == "-n" ]]; then
        find "$DIRPATH" -type f -mtime +"$DAYS" -exec rm -f {} \; 
        echo "Normal mode: Files older than ${DAYS} days have been deleted from ${DIRPATH} "

    else
        echo "Error: Invalid option try (--dry) or (-n) only"
        exit 1
fi
############################################################################################################################ 








