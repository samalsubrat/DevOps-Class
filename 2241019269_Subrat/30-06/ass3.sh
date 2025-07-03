#!/bin/bash

SOURCE="./q3"
BACKUP="./backup$(date +%Y-%m-%d).tar"

tar -czf "$BACKUP" "$SOURCE"

echo "Backup completed"
