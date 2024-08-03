#! /usr/bin/bash

################################################## Script Information #######################################################
# Discreption; ----> This scripts aims to print the disk usage of a certain directory
# Inputs: ----> Take the option and directory path as arguments.
# Outputs: ----> based on the option if the option is (-ah) will print the total disk usage of this directory and all files\
# and sub-directoriesthe but if the option is (-sh) will print the total disk usage of this directory only. 
# Auther: ----> Reem Mohy Eldin.
############################################################################################################################# 

################################################# Script Parameters #########################################################
declare OPTION=$1
declare DIRPATH=$2
############################################################################################################################# 

################################################### Script Logic ############################################################

# Check that only two arguments are based
if (( $# != 2 )); then
    echo "Error: Two arguments are required"
    exit 1
fi

# Check if the entered path is a correct directory or not
if [ ! -d "${DIRPATH}" ]; then              
    echo "Error: directory \"${DIRPATH}\" not exists"
    exit 1
fi

# Check for the option
if [[ "${OPTION}" == "-sh" ]]; then
    echo "The total disk usage of this directory is:" 
    du -sh "${DIRPATH}"
   
   elif [[ "${OPTION}" == "-ah" ]]; then
        echo "The total disk usage of this directory and all files and sub-directories is:" 
        du -ah "${DIRPATH}"
   
   else
        echo "Error: Invalid option"
        exit 1
fi
############################################################################################################################# 


