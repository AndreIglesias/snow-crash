#!/usr/bin/env bash

ROOT_DIR=$(dirname $(dirname $(dirname "$0")))

if [ ! -z "$1" ]; then
	sshpass -p $(cat $ROOT_DIR/level00/flag) ssh level01@$1 -p 4242
else
	echo "Usage: ./connect.sh <ip address>"
fi
