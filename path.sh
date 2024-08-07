#! /usr/bin/bash

declare FILEPATH

echo "Enter the file path"
read -r FILEPATH

if [ ! -f "${FILEPATH}" ]; then
    
    echo "${FILEPATH} is not a regular file"

    exit 0
fi


declare FILE_NAME
declare EXTENTION

EXTENTION="${FILEPATH#*.}"    #remove leading to get extention

FILE_NAME="${FILEPATH##*/}"   #remove leading to get file.txt
FILE_NAME="${FILE_NAME%.*}"   #remove trailing to get filels


echo "file name :${FILE_NAME}"
echo "extention :${EXTENTION}"