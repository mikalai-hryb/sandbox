#! /bin/bash
set -e # exit when any command fails

echo "inputs"
echo $0 $1 $2 $3
k=2
args=("$@") # get an array of inputs
echo ${args[2]} # index operation
echo $# # number of inputs
echo ${args[$# - 1]}

while read line; do
    echo "${line}"
done < "${1:-/dev/stdin}" # pass the first argument(we expect a file), default is standard input