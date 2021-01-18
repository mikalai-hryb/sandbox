#! /bin/bash

count=10


echo "Testing while"
start=1
while [[ ${start} -lt 10 ]]; do
    echo "Value is ${start}"
    start=$(( start + 1 ))
done

echo
echo "Testing until"
start=1
until [[ ${start} -ge 10 ]]; do
    echo "Value is ${start}"
    start=$(( start + 1 ))
done

echo
echo "Testing for1"
for i in 1 2 3 4; do
    echo "Value is ${i}"
done

echo
echo "Testing for2"
for i in {0..20..2}; do # {start..end..increment}
    echo "Value is ${i}"
done

echo
echo "Testing for3"
for (( i=0; i < ${count} - 5; i++ )); do
    echo "Value is ${i}"
done


echo
echo "Testing break"
for (( i=0; i < ${count}; i++ )); do
    if [[ ${i} -gt 5 ]]; then
        echo "break"
        break
    fi
    echo "Value is ${i}"
done

echo
echo "Testing continue"
for (( i=0; i < ${count}; i++ )); do
    if [[ ${i} -eq 5 || ${i} -eq 7 ]]; then
        echo "continue"
        continue
    fi
    echo "Value is ${i}"
done