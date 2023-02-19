#!/usr/bin/env bash

if [ "$(dirname "$0")" == "." ]; then
	ROOT_DIR=$(dirname $(dirname $PWD))
else
	ROOT_DIR=$(dirname $(dirname $(dirname "$0")))
fi

if [ ! -z "$1" ]; then
	sshpass -p $(cat $ROOT_DIR/level01/flag) ssh level02@$1 -p 4242
else
	echo "Usage: ./connect.sh <ip address>"
fi
