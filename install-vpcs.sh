#Leandro Ricardo <leandro.j.c.ricardo@gmail.com>
#!/bin/bash

# Check if the script is being run by root
if [ "$(id -u)" != "0" ]; then
	echo "This scripts must be run as root" 1>&2
	exit 1
fi

# Update system
dnf -y update

# Install dynamips dependencies
dnf -y install glibc-static
dnf -y install xterm
dnf -y install ubridge
dnf -y install telnet

# Create a temporary folder on /tmp
cd /opt/

# Clone repo from github
git clone https://github.com/GNS3/vpcs.git
cd vpcs/src
sh mk.sh

#Copy vpcs into path folders
cp vpcs /usr/bin
