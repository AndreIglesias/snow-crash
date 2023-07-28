"Verify home"
level09@SnowCrash:~$ ls
> level09  token

"Run program"
level09@SnowCrash:~$ ./level09 
> You need to provied only one arg.
level09@SnowCrash:~$ ./level09 token 
> tpmhr

"Check the input actualy modifies the string by the number of the position"
level09@SnowCrash:~$ ./level09 abc
> ace

"Check the contents of token"
level09@SnowCrash:~$ cat token 
> f4kmm6p|=�p�n��DB�Du{��
level09@SnowCrash:~$ hexdump token
> 0000000 3466 6d6b 366d 7c70 823d 707f 6e82 8283
> 0000010 4244 4483 7b75 8c7f 0a89               
> 000001a

"Make a string of hex"
66346b6d6d36707c3d827f70826e838244428344757b7f8c89

"Run this script that takes a string of hex and reduces each one by the number of the position"
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
  echo "($position)"
  ((position++))
done

echo "Original Hex Values: $1"
echo "Reduced String: $output"

"Output and flag should be this"
f3iji1ju5yuevaus41q1afiuq
