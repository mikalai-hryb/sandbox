#! /bin/bash

echo "Arrays"

integers=("one" "two" "three" "four")

unset integers[2] # remove the value but the indexes have not been changed
integers[2]="ten"

echo "${integers[@]}"
echo "${!integers[@]}" # display present indexes
echo "${#integers[@]}" # display length of the array
echo "${integers[1]}"
