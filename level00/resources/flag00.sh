#!/usr/bin/env bash

SCRIPT='
DICT="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
echo "USER: $(whoami)"
FILES=$(find / -user flag00 2>/dev/null)
for file in $FILES
do
    if [ -f "$file" ] && [ "$(echo $file | awk -F/ "{print \$2}")" != "proc" ]; then
        printf "\n%-20s : %-10s\n" $file $(cat $file)
        for rot in {0..26}
        do
            SOLVE=$(cat $file | tr "${DICT:0:26}" "${DICT:${rot}:26}")
            echo -n $SOLVE $rot
            if [ "$rot" == "11" ]; then
                echo " ✔️"
                ANS=$SOLVE
            else
                echo
            fi
        done
    fi
done
echo -e "\nPassword: \n$ANS"
'

if [ ! -z "$1" ]; then
	PASS=$(sshpass -p level00 ssh -o StrictHostKeyChecking=no level00@$1 -p $2 "$SCRIPT")
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag00.pwd
else
	echo "Usage: ./flag00.sh <ip address>"
fi
