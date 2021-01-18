#! /bin/bash

echo "Grep"
f=./notes.txt

if [ -f ${f} ]; then
    echo "Enter the text to search:"
    read grepvar
#    grep -i -n -c ${grepvar} ${f} # ignore case, display line number, line count
    grep -v -n ${grepvar} ${f} # invert match, select non-matching lines
else
    echo "${f} file does not exist."
fi
