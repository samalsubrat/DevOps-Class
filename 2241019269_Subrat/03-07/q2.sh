#!/bin/bash

userName="bobkumar"

aws iam create-user --user-name $userName

if [ $? -eq 0 ]; then
  echo "Sucessful"
else
  echo "Failed"
  exit 1
fi

declare -a policies=(
  "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  "arn:aws:iam::aws:policy/AdministratorAccess"
  "arn:aws:iam::aws:policy/IAMFullAccess"
)

for pol in "${policies[@]}";do
	aws iam attach-user-policy --user-name "$userName" --policy-arn "$pol"
done

echo "done"
