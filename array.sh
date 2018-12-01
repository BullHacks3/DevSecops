#!/bin/bash

array=(First 2 Third 4 Fifth)

echo "Number of values in array is :- ${#array[@]}"
for i in ${array[@]};
do
	printf "%s\t" $i
done
printf "\n"
