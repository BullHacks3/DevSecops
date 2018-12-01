#!/bin/bash

function command_descriptor()
{
for i in `cat README1.md`;
do
	help=$(man $i | grep -i -A1 NAME | head -2 | tail -1 | awk '{$1=$2="";print $0}')
	printf "%-10s \t \t | %s \n" "$i" "$help" >> new.txt


done
}



command_descriptor
