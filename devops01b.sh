#!/bin/bash

args=("$@")
count=0
while [ $count -lt $# ]; do
	
	case ${args[$count]} in 
		volume) 

			#number of volumes, size of each volume , free space on each volume
			echo -e "Filesystems Info:"
			df -H | awk '{print $1 "\t" $2 "\t" $3 "\t" $4}'
			echo $'\n'
			;;
		cpu)

			#number of cpus,information about cpus/core
			echo -e "CPU info"
			cat /proc/cpuinfo | awk '/processor/{c=10} c&&c--'
			echo $'\n'
			;;
		ram)

			#amount of ram
			echo -e "Memory info"
			cat /proc/meminfo | head -2
			echo $'\n'
			;;
		network)

			##MAC address and ip address
			echo "MAC address:"
			getmac -V -FO CSV | awk -F ',' '{if(match($1,"Ethernet"))print $3;}'
			echo $'\n'
			echo "IP address"
			ipconfig | awk 'c&&!--c;/Wi-Fi/{c=7}'
			;;
		all)
			#number of volumes, size of each volume , free space on each volume
			echo -e "Filesystems Info:"
			df -H | awk '{print $1 "\t" $2 "\t" $3 "\t" $4}'
			echo $'\n'

			#number of cpus,information about cpus/core
			echo -e "CPU info"
			cat /proc/cpuinfo | awk '/processor/{c=10} c&&c--'
			echo $'\n'

			#amount of  ram
			echo -e "Memory info"
			cat /proc/meminfo | head -2
			echo $'\n'

			#MAC address and ip address
			echo "MAC address:"
			getmac -V -FO CSV | awk -F ',' '{if(match($1,"Ethernet"))print $3;}'
			echo $'\n'
			echo "IP address"
			ipconfig | awk 'c&&!--c;/Wi-Fi/{c=6}'
			;;

		*) 
			echo -e "Enter Any of the arfuments among : "$'\n'"volume: TO Display the info about volumes/filesystems"$'\n'"CPU:To display the info about CPU"$'\n'"RAM:TO display the info about ram"$'\n'"Network:TO display MAc and IP address"$'\n'"ALL:TO display all the above info"
	esac

let count=$count+1

done 
