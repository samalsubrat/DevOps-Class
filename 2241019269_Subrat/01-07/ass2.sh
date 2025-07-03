#!/bin/bash
user=$(cat /var/log/auth.log | sort -nr | uniq | awk 'NR==1 {print $6}' | sed "s/:$//")
echo "$user"
find /home -user "$user"
