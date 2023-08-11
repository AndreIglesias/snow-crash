#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/05 17:41:34 by ciglesia          #+#    #+#              #
#    Updated: 2023/03/05 17:44:49 by ciglesia         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = dirtycow
SRCS = dirtycow.c

OBJS = $(SRCS:.c=.o)

CC = gcc
CFLAGS = -pthread
LIBS = -lcrypt

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
