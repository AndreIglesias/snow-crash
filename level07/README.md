# Level07 Exploit

In this challenge, we have an executable named `level07` located in the home directory of `level07`. By analyzing the executable using the `strings` command, we observe that it utilizes the `LOGNAME` environment variable and prints its value using `echo`. This presents an opportunity for exploitation, as we can manipulate the `LOGNAME` variable to execute arbitrary commands on the system.

## Vulnerability Analysis

The `level07` executable relies on the `LOGNAME` environment variable to print its value. By setting the `LOGNAME` variable to a command we want to execute, we can trick the executable into executing our desired command.

## Exploit Procedure

To exploit this vulnerability and execute arbitrary commands on the system, we can craft a command that sets the `LOGNAME` variable to the command we want to execute and then runs the `level07` executable. Here's the exploit script:

```bash
cat <<EOF
LOGNAME='\`/bin/getflag\`'; ./level07 | awk '{print $NF}'
EOF
```

This script sets the `LOGNAME` variable to the command `/bin/getflag` wrapped in backticks, and then runs the `level07` executable. It captures the output and extracts the flag.
