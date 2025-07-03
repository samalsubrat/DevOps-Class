#!/bin/bash

SOURCE="./q3"

for i in {1..5}
do
  BACKUP="./backup$(date +%Y-%m-%d_%H-%M-%S)_$i.tar"
  tar -czf "$BACKUP" "$SOURCE"
  echo "Backup $i completed: $BACKUP"
  sleep 2
done

