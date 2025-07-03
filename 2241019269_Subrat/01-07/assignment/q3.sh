#!/bin/bash
usage=$(df -h / | awk 'NR>1 {print $5}' | sed "s/%//")
if [ "$usage" -ge 30 ]; then
	echo "Overflow"
else
	echo "Normal"
fi
