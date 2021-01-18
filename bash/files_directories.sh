#! /bin/bash

echo "Files and Directories"

mkdir -p testFolder
echo "Enter directory name to check:"
#read directory
directory="testFolder"
if [ -d ${directory} ]; then
    echo "${directory} exists"
else
    echo "${directory} does not exit"
fi
rm $directory -d

echo "Enter file name to create:"
#read fileName
fileName="testFile.txt"
touch ${fileName}
rm ${fileName}

echo "Enter filename to check:"
#read fileName
fileName=$0
if [ -f $fileName ]; then
    echo "${fileName} exists"
else
    echo "${fileName} does not exist"
fi

echo "Enter filename in which you want to append:"
#read
fileName="bla"
if [ -f $fileName ]; then
    echo "Enter the text to append:"
    read fileText
    echo ${fileText} >> ${fileName}
else
    echo "${fileName} does not exist"
fi


echo "Enter filename you want to read:"
read fileName
if [ -f $fileName ]; then
    while read -r line; do
        echo ${line}
    done < ${fileName}
    # The C standard says that text files must end with a newline or
    # the data after the last newline may not be read properly
    if [ -n "${line}" ]; then
        echo "${line}"
    fi
else
    echo "${fileName} does not exist"
fi
