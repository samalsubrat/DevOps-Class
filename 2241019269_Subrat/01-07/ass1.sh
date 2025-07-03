#!/bin/bash
var=$(find "$1" -exec stat --format='%Y %n' {} + | sort -n | tail -1 | cut -d' ' -f2-)
echo "The most recent file: ${var}"
cat $var
cp "$var" "${var}_copy"
echo "Most Recurring word: "
cat "${var}_copy" | tr '[:space:]' "\n" | sort | uniq -c | sort -nr | awk 'NR==1 {print $2}'
