#!/bin/bash

FOLDER="/home/iteradmin/myfolder"
FILE="$FOLDER/a.txt"

mkdir -p "$FOLDER"

echo "Hi, $(date)" >> "$FILE"
