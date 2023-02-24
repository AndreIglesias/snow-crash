#!/usr/bin/env bash

declare -a deps=(
	[0]=sshpass
	[1]=tshark
	[2]=build-essential
	[3]=libssl-dev
	[4]=git
	[5]=zlib1g-dev
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
if [ ! -f ".env" ]; then
	read -p "Do you want to set the IP in an env file for the connect script [Y/n]: " yn
	yn=${yn:-y}
	case $yn in
		[Yy]* )
			read -p "What is the ip address of the snow-crash server: " ip;
			echo "IP=$ip" > .env;;
		* ) echo "Not creating the .env file ...";;
	esac
fi
