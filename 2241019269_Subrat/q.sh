#!/bin/bash
grep "Accepted" /var/log/auth.log | awk '{print $1, $2, $3, $9, $11}' | sort | uniq

echo ""
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I)"
grep "model name" /proc/cpuinfo | awk '{for (i=4; i<=NF; i++) printf $i (i==NF ? "\n" : " ")}' | uniq
echo "Total Memory: $(free -h | awk '/Mem:/ {print $2}')"
var = $(df -h / | awk 'NR==2 {print $3}')
echo "Disk Usage: $(var)"
