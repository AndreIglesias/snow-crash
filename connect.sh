#!/usr/bin/env bash

LAST_EXERCISE=9

if [ ! -z "$1" ] && [ ! -z "$2" ]; then
	if [[ "$1" =~ ^[0-9]+$ ]] && ((0 <= $1 && $1 <= $LAST_EXERCISE)); then
		NUM=$(printf '%02d' "$1")
		LEVEL=level$NUM
		PREVL=level$(printf "%02d" $((10#$NUM - 1)))
		echo "Connecting to $LEVEL with $PREVL's flag..."
		if (($1 == 0)); then
			sshpass -p level00 ssh $LEVEL@$2 -p 4242
		else
			sshpass -p $(cat $PREVL/flag) ssh $LEVEL@$2 -p 4242
		fi
	else
		echo "Enter a valid number between 0 and $LAST_EXERCISE"
		echo "Usage ./connect.sh <Exercise number> <ip address>"
	fi
else
	echo "Usage ./connect.sh <Exercise number> <ip address>"
fi
