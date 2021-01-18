#! /bin/bash

#ls -al 1> file1.txt 2> file2.txt
#ls -al > file1.txt # no 1> but it still redirects stdout to the file
ls -al 1> file1.txt 2>&1 # one file for both stdout and stderr
ls -al >& file1.txt # one file for both stdout and stderr