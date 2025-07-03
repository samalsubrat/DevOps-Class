#!/bin/bash
cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
memory=$(free | grep Mem | awk '{print $3/$2*100}')
disk=$(df / | grep / | awk '{ print $5 }')
network=$(netstat -i | grep lo | awk '{print $3, $11}')
echo "CPU Usage:  $cpu"
echo "Memory Usage: $memory"
echo "Disk Usage: $disk"
echo "Network Usage: $network"
