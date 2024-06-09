#!/bin/bash
# Function to display the current date and time
function display_datetime {
    date=$(date +'%m/%d/%Y')
    time=$(date +'%r')
    echo "Today is $date and $time"
    echo
}

# Function to display the menu
function menu {
    echo -e "\nMenu"
    echo -e "1. Search file"
    echo -e "2. Search folder"
    echo -e "3. Search text withing files"
    echo -e "0. Exit menu"
    echo
    echo -en "Enter an option: "
    read -n 1 option
    echo
}

# Function to search for a file
function search_file {
    echo -n "Enter a path: "
    read path
    echo -n "Enter a file name: "
    read filename
    find "$path" -iname "${filename}*" -type f 2>&1 | grep -v "Permission denied"
}

# Function to search for a folder
function search_folder {
    echo -n "Enter a path: "
    read path
    echo -n "Enter a folder name: "
    read foldername
    find "$path" -iname "$foldername" -type d 2>&1 | grep -v "Permission denied"
}

# Function to search for text within files
function search_text {
    echo -n "Enter a path: "
    read path
    echo -n "Enter text to search for: "
    read searchtext
    grep -r "$searchtext" "$path" 2>/dev/null | grep -v "Permission denied"
}

# Main loop
while true; do
    display_datetime
    menu
    case $option in
    0)
        exit
        ;;
    1)
        search_file
        ;;
    2)
        search_folder
        ;;
    3)
        search_text
        ;;
    *)
        echo "Invalid option."
        ;;
    esac
    echo -e "\nPress any key to return to the menu..."
    read -n 1
    clear
done
