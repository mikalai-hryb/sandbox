#! /bin/bash

set -x
echo "Screen EDitor"

echo "Enter file name to substitute using sed"
read fileName

set +x
if [ -f ${fileName} ]; then
    A=$(cat ${fileName})
    echo ${A}
    echo ${A} | sed 's/i/I/g' > "${fileName}"
else
    echo "${fileName} file does not exist"
fi
