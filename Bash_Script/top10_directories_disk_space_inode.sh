#! /bin/bash

#read -p "Enter the path :- " SECOND

echo "Directories In Decreasing Order Of Inodes Usage "
du / --inode -h -S 2> /dev/null | sort -r -h | head -10 | column -t

