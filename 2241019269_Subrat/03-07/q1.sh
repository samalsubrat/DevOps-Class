#!/bin/bash

userName="bobk"

aws iam create-user --user-name $userName

if [ $? -eq 0 ]; then
  echo "Sucessful"
else
  echo "Failed"
  exit 1
fi

userDetails=$(aws iam get-user --user-name $userName)

echo "$userDetails"

echo "Creation Timestamp"
echo "$userDetails" | awk 'NR==3 {print $2}'
