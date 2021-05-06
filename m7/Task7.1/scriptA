#!/bin/bash

usage()
{
echo -e "Usage: scriptA [Options]\nOptions:\n--all\t\tdisplay the IP addresses and symbolic names of all hosts in the current subnet\n--target\tdisplay a list of open system TCP ports"
}

all()
{
net_ip=`ip a | grep ens33 | sed -n 2p | awk '{print $2}' | awk -F . '{$4 = "*"; print }' | sed -r 's/[ ]+/./g'`
hosts_net=`nmap -sn $net_ip | grep "report for" | awk '{print $5}'`
echo -e "All hosts in the current subnet:\n$hosts_net\n"
}

ports()
{
open_ports=`nmap -sT $ports_ip |grep tcp  `
echo -e "The list of open system TCP ports on the $ports_ip:\n$open_ports\n"
}

check_ip()
{
if [[ ! $ports_ip =~ ^([0-9]{1,3}[\.]){3}[0-9]{1,3}$ ]]; then
echo -e "Invalid IP address!\nIP address was set in localhost IP".
ports_ip="localhost"
fi
}

target_ip=1
if [ $# == 0 ]
then usage
else

	case $1 in
	--all) all ;;  
	--target) 
		if [[ -z $2 ||  $2 = "--all" ]]
		then
		ports_ip="localhost"
		else	
		target_ip=0
		eval ports_ip=$2 
		check_ip
		fi
		ports ;;
	*) echo Invalid option!
	usage ;;
	esac

	if [ $target_ip -eq 1 ] && [ ! -z $2 ]
	then
	case $2 in
	--all) all ;;  
	--target) 
		if [ -z $3  ]
		then
		ports_ip="localhost"
		else
		eval ports_ip=$3
		check_ip
		fi
		ports ;;
	*) echo 1 Invalid option!
	usage ;;
	esac

	elif  [ ! -z $3 ]
	then
	case $3 in
	--all) all ;;  
	--target) 
		if [ -z $3  ]
		then
		ports_ip="localhost"
		else
		eval ports_ip=$3
		check_ip
		fi
		ports ;;
	*) echo 2 Invalid option!
	usage ;;
	esac

	fi

fi



