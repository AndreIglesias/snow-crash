# Level03 Exploit

In this challenge, we aim to exploit a vulnerability in an executable file named level03 found in the home directory of `level03`.

## Vulnerability Analysis

Upon examining the executable using the `strings` command, we observe that it utilizes the `echo` command located at `/usr/bin/env echo`. This presents an opportunity for exploitation, as we can create a script named `echo` that will be executed instead of the system's default `echo` command.

## Exploit Procedure

To exploit this vulnerability, we can create a script named `echo` that executes `/bin/getflag`. Then, we add this script to the `PATH` environment variable to ensure it is executed when the `echo` command is invoked within `level03`.

Here's the exploit script:

```bash
echo "/bin/getflag" > /tmp/echo
chmod +x /tmp/echo
export PATH=/tmp:$PATH
./level03
```

This script creates a file named `echo` in the `/tmp` directory, containing the command `/bin/getflag`. It sets the executable permission for this file and adds `/tmp` to the beginning of the `PATH` environment variable. Finally, it executes `level03`, which will now invoke our custom `echo` script, leading to the execution of `/bin/getflag`.

Execute the above script in the same directory as `level03` to exploit the vulnerability and retrieve the flag.

