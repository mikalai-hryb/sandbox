#! /bin/bash

echo "AWK"

echo "Enter filename to print from awk"
#read fileName
fileName=./notes.txt

if [ -f ${fileName} ]; then
    awk '/men/ {print $3 " " $4}' ${fileName} # print third and fourth words in matched lines
else
    echo "${fileName} file does not exist"
fi
