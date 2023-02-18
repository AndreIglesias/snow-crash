#!/usr/bin/env bash

SCRIPT='
DICT="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
echo "USER: $(whoami)"
FILES=$(find / -user flag00 2>/dev/null)
for file in $FILES
do
    if [ -f "$file" ];then
        printf "\n%-20s : %-10s\n" $file $(cat $file)
        for rot in {0..26}
        do
            SOLVE=$(cat $file | tr "${DICT:0:26}" "${DICT:${rot}:26}")
            echo -n $SOLVE $rot
            if [ "$SOLVE" == "nottoohardhere" ]; then
                echo " ✔️"
            else
                echo
            fi
        done
    fi
done
'

if [ ! -z "$1" ]; then
	sshpass -p level00 ssh level00@$1 -p 4242 "$SCRIPT"
else
	echo "Usage: ./flag00.sh <ip address>"
fi
