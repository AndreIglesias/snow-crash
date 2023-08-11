/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   dirtycow.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/05 14:48:48 by ciglesia          #+#    #+#             */
/*   Updated: 2023/03/05 19:13:50 by ciglesia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef		DIRTYCOW_H
# define	DIRTYCOW_H

# include <fcntl.h>
# include <pthread.h>
# include <string.h>
# include <stdio.h>
# include <stdint.h>
# include <sys/mman.h>
# include <sys/types.h>
# include <sys/stat.h>
# include <sys/wait.h>
# include <sys/ptrace.h>
# include <stdlib.h>
# include <unistd.h>
# include <crypt.h>

# define PWDFILE "/etc/passwd"
# define PWDBKP "/tmp/passwd.bkp"

typedef struct s_userinfo {
   char *username;
   char *hash;
   int user_id;
   int group_id;
   char *info;
   char *home_dir;
   char *shell;
} t_userinfo;

#endif
