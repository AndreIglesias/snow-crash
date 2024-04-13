# Level09 Exploit

In this challenge, we have an executable named `level09` and a file named `token`. Upon executing `level09`, we observe that it requires exactly one argument. Additionally, we notice that the output of the program changes based on the input, and the contents of the `token` file are in hexadecimal format.

## Initial Exploration

Let's start by verifying the contents of the home directory:

```bash
level09@SnowCrash:~$ ls
> level09  token
```

Next, we attempt to run the level09 program:

```bash
level09@SnowCrash:~$ ./level09 
> You need to provied only one arg.
level09@SnowCrash:~$ ./level09 token 
> tpmhr
```

We also check the behavior of the program with different input:

```bash
level09@SnowCrash:~$ ./level09 abc
> ace
```

## Vulnerability Analysis

Upon examining the contents of the `token` file and the behavior of the `level09` program, we deduce that the program modifies the input string based on the position of each character. Additionally, the `token` file contains hexadecimal values.

## Exploit Procedure

To exploit this vulnerability and retrieve the flag, we can write a script that takes a string of hexadecimal values as input, reduces each value based on its position, and converts it back to ASCII characters. Here's the exploit script:

```bash
#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <hex_values>"
  exit 1
fi

input_hex="$1"
output=""
position=0

while [ -n "$input_hex" ]; do
  char=${input_hex:0:2}        # Extract the first two characters (hex value) from the input
  input_hex=${input_hex:2}     # Remove the first two characters from the input

  ascii_val=$((16#$char))      # Convert hexadecimal to decimal (base 16 to base 10)
  reduced_ascii_val=$((ascii_val - position))
  reduced_ascii_val=$((reduced_ascii_val % 255))
  reduced_char=$(printf "\\$(printf '%03o' "$reduced_ascii_val")")
  output="$output$reduced_char"
  ((position++))
done

echo "Original Hex Values: $1"
echo "Reduced String: $output"
```

Ensure to execute this script with the string of hexadecimal values extracted from the `token` file.

## Conclusion

By reducing each hexadecimal value based on its position and converting it back to ASCII characters, we successfully retrieved the flag: `f3iji1ju5yuevaus41q1afiuq`.