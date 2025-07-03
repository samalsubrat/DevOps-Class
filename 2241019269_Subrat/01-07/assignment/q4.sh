#!/bin/bash

dir=$(cat /etc/passwd | cut -d: -f6)
username=$(cat /etc/passwd | cut -d: -f1)

for dir in $(cut -d: -f6 /etc/passwd);
do 
if [ -d "$dir" ]; 
then 
echo "Exists" 
else 
echo "Doesn't exist" 
fi 
done


