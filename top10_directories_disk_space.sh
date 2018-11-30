#! /bin/bash
#read -p "Enter the path to be used :- " FIRST
du / -hS 2> /dev/null | sort -rh | head -10
