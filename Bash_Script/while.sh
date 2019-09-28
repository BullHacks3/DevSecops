#!/bin/bash

Initial=2
while [[ $Initial -ne 22 ]];
do
	echo $Initial
	Initial=$(($Initial+2))
done
