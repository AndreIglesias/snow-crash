#!/usr/bin/env bash

if [ ! -z "$1" ];then
	sshpass -p $(cat ../../level00/flag) scp -P 4242 level01@$1:/etc/passwd /tmp/
	cat /tmp/passwd
	echo -e "\nCracking with john...\n"
	sudo john /tmp/passwd --show | awk -F: 'NR==1 {print $2}'
else
	echo "Usage: ./flag01.sh <ip address>"
fi
