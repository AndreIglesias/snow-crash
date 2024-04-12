# Level01 Password Decryption

In this challenge, our objective is to obtain the password for the `flag01` account.
## Challenge Overview

The flag we're searching for is actually the password associated with the flag01 account. This password is stored in the `/etc/passwd` file, but in a hashed form.
Approach

To decrypt the user password stored in `/etc/passwd`, we can utilize tools like **John the Ripper**. Unix-based systems, historically, employed a weak form of password storage known as crypt or DES-based hashing. This algorithm, used in older Unix systems, lacks resistance against modern cryptographic attacks such as brute-force or dictionary attacks.

We can execute the following command to decrypt the user password:

```bash
john /etc/passwd --format=crypt
```
> [!NOTE]
> Keep in mind that this decryption process exploits the vulnerability of outdated hashing algorithms. In modern systems, more secure hashing algorithms like SHA-256 or bcrypt are commonly employed to mitigate such vulnerabilities.