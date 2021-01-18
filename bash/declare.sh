#! /bin/bash

echo "Declare"

declare -p

declare -r pwdfile=/etc/passwd
echo $pwdfile

pwdfile=/etc/abc.txt
echo $pwdfile

