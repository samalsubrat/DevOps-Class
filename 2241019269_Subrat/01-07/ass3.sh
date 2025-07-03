#!/bin/bash
file=$(find ./ -name "config.d")
if [ -n "$file" ]; then
modified=$(echo "$file" | sed 's/\//-/g')
echo "$modified"
else
echo "not found"
fi
