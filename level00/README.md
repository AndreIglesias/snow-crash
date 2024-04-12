# Level00 Flag Deciphering

In this challenge, our goal is to uncover the password for the `flag00` account.

## Challenge Overview

The flag we're aiming to discover is actually the password associated with the `flag00` account. To begin our investigation, we can start by identifying files owned by this user.

## Approach

To find files owned by the `flag00` user, we can execute the following command:

```bash
find / -user flag00 2> /dev/null
```

This command helps us locate files owned by the specified user. Upon running this command, we identify two files: `/usr/sbin/john` and `/rofs/usr/sbin/john`. Among these files, an intriguing string `cdiiddwpgswtgt`, captures our attention. It appears to be a simple substitution cipher.

We proceed to decipher this string using the provided algorithm:

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

Upon examination, we discover that one of the output rotations (ROT-11) reveals the deciphered text: `nottoohardhere`.

This deciphered text likely serves as the password for the `flag00` account.

> [!NOTE]
> In solving this challenge, we utilize a basic substitution cipher decryption technique. It's important to note that encryption and decryption methods can vary widely, and this specific method is just one approach among many.