#!/usr/bin/env bash

declare -a deps=(
	[0]=sshpass
	[4]=build-essential
	[5]=libssl-dev
	[6]=git
	[7]=zlib1g-dev
)

install_deps()
{
	sudo apt-get -y install "${deps[@]}"
	if [ ! -d "john" ]; then
		git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john
		cd john/src/ && ./configure && make -s clean && make -sj4
		alias john="$PWD/john/run/john"
	else
		echo -e "\njohn/ is already installed"
	fi
}

install_deps
