#!/bin/bash

DEST=./myfolder2/logBackup
mkdir -p "$DEST"

for file in /var/log/*.log;
do
	if [ -f "$file" ]; then
		cp "$file" "$DEST"
		echo "Copied: $file"
	fi
done
