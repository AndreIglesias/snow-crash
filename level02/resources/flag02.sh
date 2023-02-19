#!/usr/bin/env bash

if [ "$(dirname "$0")" == "." ]; then
	ROOT_DIR=$(dirname $(dirname $PWD))
else
	ROOT_DIR=$(dirname $(dirname $(dirname "$0")))
fi

if [ ! -z "$1" ];then
	if [ ! -f "/tmp/level02.pcap" ]; then
		sshpass -p $(cat $ROOT_DIR/level01/flag) scp -P 4242 level02@$1:/home/user/level02/level02.pcap /tmp/level02.pcap
	fi
	tshark -r /tmp/level02.pcap -Y "tcp.flags.push == 1" -T fields -e data | xxd -r -p > /tmp/level02.txt
	cat /tmp/level02.txt
	echo "Reading the flag..."
	flag=$(cat /tmp/level02.txt | grep -a "^Password" | awk '{print $2}' | tr -cd [:print:])
	echo -e "\nPassword:\n$flag"
	echo $flag > flag02.pwd
else
	echo "Usage: ./flag01.sh <ip address>"
fi
