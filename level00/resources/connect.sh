#!/usr/bin/env bash

if [ ! -z "$1" ]; then
	sshpass -p level00 ssh level00@$1 -p 4242
else
	echo "Usage: ./connect.sh <ip address>"
fi
