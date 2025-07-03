#!/bin/bash

homeDir="~"
for dir in $(cut -d: -f6 /etc/passwd); do
    # Construct the path relative to your home directory
    target="$homeDir$dir"
    
    if [ -d "$target" ]; then
        echo "$target exists"
    else
        echo "$target doesn't exist"
    fi
done
