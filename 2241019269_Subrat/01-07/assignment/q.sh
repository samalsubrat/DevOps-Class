#!/bin/bash
echo -e "SSH Sessions: \n$(awk '{print $6}' /var/log/auth.log | sort | sed "s/:$//" | uniq)"
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I)"
grep "model name" /proc/cpuinfo | awk '{for (i=4; i<=NF; i++) printf $i (i==NF ? "\n" : " ")}' | uniq
echo "Total Memory: $(free -h | awk '/Mem:/ {print $2}')"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3}')"

