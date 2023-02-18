#!/usr/bin/env bash

declare -a deps=(
	[0]=sshpass
	[1]=john
)

sudo apt-get -y install "${deps[@]}"
