#!/usr/bin/env bash

# Prompt for the directory to search
read -p "Enter the directory to search (press Enter for current directory): " search_dir
search_dir="${search_dir:-.}"

echo "Searching for file types starting with 'm' in $search_dir and its subfolders..."

# Use find to get all files and their extensions, filter for those starting with 'm'
find "$search_dir" -type f |
awk -F. '{if (NF>1 && $NF ~ /^a/) {print $NF}}' |
sort |
uniq -c |
sort -rn |
while read -r count ext; do
    echo "$count files with extension: .$ext"
done

echo "Search complete."
