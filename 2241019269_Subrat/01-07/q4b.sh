#!/bin/bash

dirs=$(cut -d: -f6 /etc/passwd)

for dir in $dirs; do
    if [ -d "$dir" ]; then
        echo "$dir exists"
    else
        echo "$dir does not exist"
    fi
done
