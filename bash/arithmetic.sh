#! /bin/bash

echo "Arithmetic"
echo

n1=4
n2=20

echo $(( n1 + n2 ))
#echo $(expr ${n1} + ${n2}) # the same as the line above
echo $(( n1 - n2 )) # subtraction
echo $(( n1 * n2 )) # multiplication
echo $(( n1 / n2 )) # division (we get an integer but not a float)
echo $(( n1 % n2 )) # get remainder

echo "Type a hex number:"
read hex
hex=${hex^^}

echo -n "The decimal number is: "
echo "obase=10; ibase=16; ${hex}" | bc # bc - bash calculator, obase must come before ibase, hex must be in uppercase
