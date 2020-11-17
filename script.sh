#!/bin/bash
date=$(date +'%m/%d/%Y')
time=$(date +'%r')
echo "Today is $date and $time"

echo

#Simple menu
function menu {
echo -e "Menu"
echo -e "1. Search file"
echo -e "2. Search folder"
echo -e "0. Exit menu"
echo -en "Enter option: "
read -n 1 option
echo
}

menu
case $option in
0) exit ;;
1) echo -n "Enter a path: "
read path
echo -n "Enter a file name: "
read filename
eval find $path -iname "$filename*" -type f 2>&1 | grep -v "Permission denied";;
2) echo -n "Enter a path: "
read path
echo -n "Enter a folder name: "
read foldername
eval find $path -iname "$foldername" -type d 2>&1 | grep -v "Permission denied";;
esac

