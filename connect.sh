#!/usr/bin/env bash

LAST_EXERCISE=9

if [ ! -z "$1" ] && [ ! -z "$2" ]; then
	if [[ "$1" =~ ^[0-9]+$ ]] && ((0<= $1 && $1 <= $LAST_EXERCISE)); then
		level$(printf '%02d' "$1")/resources/connect.sh $2
	else
		echo "Enter a valid number between 0 and $LAST_EXERCISE"
		echo "Usage ./connect.sh <Exercise number> <ip address>"
	fi
else
	echo "Usage ./connect.sh <Exercise number> <ip address>"
fi
