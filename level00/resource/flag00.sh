#!/usr/bin/env bash

SCRIPT='
DICT="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
echo "USER: $(whoami)"
FILES=$(find / -user flag00 2>/dev/null)
for file in $FILES
do
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
done
'

echo $SCRIPT
sshpass -p level00 ssh level00@localhost -p 4242 "$SCRIPT"
