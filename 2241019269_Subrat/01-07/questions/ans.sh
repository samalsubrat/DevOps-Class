#!/bin/bash

#ans1
echo -e "Answer1"
awk 'tolower($1) ~ /^s.*.$/ { print $1, $2, $3 }' data.txt

#ans2
echo -e "\nAnswer2"
grep 'n$' data.txt

#ans3
echo -e "\nAnswer3"
awk 'tolower($1) ~ /^j.*.n$/ { print $1, $2, $3 }' data.txt

#ans4
echo -e "\nAnswer4"
ifconfig | awk '/^[a-zA-Z0-9]/ {iface = $1} /inet/ && !/inet6/ {printf "%-20s %-20s %-20s %-20s\n","Interface: " iface, "IPV4: " $2, "Mask: " $4, "Broadcast: " $6 }'

#ans5
echo -e "\nAnswer5"
echo "TestT100String" | grep -o '[0-9]\+'

#ans6
echo -e "\nAnswer6"
echo "I really like Hello" | sed 's/ll/l/g'


#ans7
echo -e "\nAnswer7"
echo "Hi Henry went Home" | sed 's/\bH\w*/REPLACED/g'

