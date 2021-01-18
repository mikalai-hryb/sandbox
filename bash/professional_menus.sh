#! /bin/bash

echo "Professional Menus"

#select number in ONE TWO THREE FOUR
#do
#    case ${number} in
#    ONE)   echo "bla1";;
#    TWO)   echo "bla2";;
#    THREE) echo "bla3";;
#    FOUR)  echo "bla4";;
#    *)     echo "Please select between 1..5";;
#    esac
#done

echo "press any key to continue"
while [ true ]; do
    read -t 3 -n 2 # wait only 3 seconds, 2 characters are allowed

    if [ $? = 0 ]; then # $? is the exit status of the last executed command.
        echo "You have terminated the script"
        exit;
    else
        echo "waiting for you to press the key sir!"
    fi
done
