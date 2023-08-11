#!/usr/bin/env bash

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ] ;then
    sshpass -p $3 scp -o StrictHostKeyChecking=no -P $2 level02@$1:/home/user/level02/level02.pcap /tmp/level02.pcap
    #chown root:user /tmp/level02.pcap
    tshark -r /tmp/level02.pcap -Y "tcp.flags.push == 1" -T fields -e data | xxd -r -p > /tmp/level02.txt
    cat /tmp/level02.txt
    echo -e "\nReading the flag..."
    flag=$(cat /tmp/level02.txt | grep -a "^Password" | awk '{print $2}' | tr -cd [:print:])
    echo -e "\nPassword:\n$flag"
    echo $flag > flag02.pwd #ft_waNDReL0L
else
    echo "Usage: ./flag01.sh <ip address> <port> <password>"
fi
