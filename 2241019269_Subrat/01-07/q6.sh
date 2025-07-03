#!/bin/bash

services=("nginx" "ssh")

for sv in "${services[@]}";do
if systemctl is-active --quiet "$sv";then
  echo "$sv is active"
else 
  echo "$sv is not active"
fi
done
