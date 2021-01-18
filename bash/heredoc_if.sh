#! /bin/bash

cat <<- HeredocDelimiter
		This is my $(basename ${0}) script
HeredocDelimiter

filename=input.txt
echo "Type something, Ctrl+D when you are done, will find your data in ${filename}"
cat >> ${filename}


age=35
if [[ ${age} -gt 18 && ${age} -lt 40 ]]; then
    echo "yes, the age is between 18 and 40"
fi
