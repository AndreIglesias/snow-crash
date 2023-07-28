#!/usr/bin/env bash

if [ "$(dirname "$0")" == "." ]; then
	ROOT_DIR=$(dirname $(dirname $PWD))
else
	ROOT_DIR=$(dirname $(dirname $(dirname "$0")))
fi

if [ -f "$ROOT_DIR/john/run/john" ]; then
	JOHN=$ROOT_DIR/john/run/john
else
	echo "Please install john in the root directory of the repository ($ROOT_DIR)">&2
	exit 1
fi

if [ ! -z "$1" ];then
	sshpass -p $(cat $ROOT_DIR/level00/flag) scp -P $2 level01@$1:/etc/passwd /tmp/
	cat /tmp/passwd
	echo -e "\nCracking with john...\n"
	$JOHN /tmp/passwd --format=crypt
	EXIT_STATUS=$?
	if ! (exit $EXIT_STATUS); then
		echo "Error decrypting passwd with john">&2
		exit 1
	fi
	flag=$($JOHN /tmp/passwd --show | awk -F: 'NR==1 {print $2}')
	echo -e "Password:\n$flag"
	echo $flag > flag01.pwd
else
	echo "Usage: ./flag01.sh <ip address>"
fi
