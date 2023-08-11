#!/usr/bin/env bash

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ] ;then

    # Download the level02.pcap file from level02@<ip_address>:/home/user/level02/level02.pcap
    sshpass -p $3 scp -o StrictHostKeyChecking=no -P $2 level02@$1:/home/user/level02/level02.pcap /tmp/level02.pcap

    # Extract the data from the level02.pcap file and save it to /tmp/level02.txt
    # Read the pcap file
    # only show packets with the push PSH flag set to 1
    # Output in "fields" format
    # Extract the data field
    # Convert from hex to binary, and write to a file
    tshark -r /tmp/level02.pcap \
        -Y "tcp.flags.push == 1" \
        -T fields \
        -e data | \
        xxd -r -p > /tmp/level02.txt
    # Print the contents of /tmp/level02.txt
    cat /tmp/level02.txt

    # Print the contents of /tmp/level02.txt that start with "Password" and remove all non-printable characters
    echo -e "\nReading the flag..."
    flag=$(cat /tmp/level02.txt | grep -a "^Password" | awk '{print $2}' | tr -cd [:print:])

    # Print the flag
    echo -e "\nPassword:\n$flag"

    # Save the flag to flag02.pwd
    echo $flag > flag02.pwd #ft_waNDReL0L
else
    echo "Usage: ./flag01.sh <ip address> <port> <password>"
fi
