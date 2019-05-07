#!/bin/bash

#number of volumes, size of each volume , free space on each volume
echo -e "Filesystems Info:"
df -H | awk '{print $1 "\t" $2 "\t" $3 "\t" $4}'
echo $'\n'

#number of cpus,information about cpus/core
echo -e "CPU info"
cat /proc/cpuinfo | awk '/processor/{c=10} c&&c--'
echo $'\n'

#amount of ram
echo -e "Memory info"
cat /proc/meminfo | head -2
echo $'\n'

#MAC address and ip address
echo "MAC address:"
getmac -V -FO CSV | awk -F ',' '{if(match($1,"Ethernet"))print $3;}'
echo $'\n'
echo "IP address"
ipconfig | awk 'c&&!--c;/Wi-Fi/{c=4}'
