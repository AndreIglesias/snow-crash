# level00

The flag we search for is the password for the account `flag00`. 

We can try to find the files owned by this user with this command:
```bash
find / -user flag00 2> /dev/null
```

We get two files: `/usr/sbin/john` and `/rofs/usr/sbin/john`. And in one of them there's an eye catching string `cdiiddwpgswtgt`, which might be a simple substitution cipher.

As we try to decipher with this algorithm.

```bash
DICT="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
echo "USER: $(whoami)"
FILES=$(find / -user flag00 2>/dev/null)
for file in $FILES
do
    if [ -f "$file" ] && [ "$(echo $file | awk -F/ "{print \$2}")" != "proc" ]; then
        printf "\n%-20s : %-10s\n" $file $(cat $file)
        for rot in {0..26}
        do
            SOLVE=$(cat $file | tr "${DICT:0:26}" "${DICT:${rot}:26}")
            echo $SOLVE $rot
        done
    fi
done
```

We see that one of the output rotations (ROT-11) is: `nottoohardhere`.