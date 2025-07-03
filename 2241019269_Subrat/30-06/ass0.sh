#!/bin/bash

DIR="./q4"
for file in "$DIR"/*txt;
do
[ -e "$file" ] || continue
mv "$file" "${file%.txt}.php"
echo "converted"
done
