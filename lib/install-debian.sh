#!/bin/bash

sudo apt update
sudo apt install apt-transport-https lsb-release ca-certificates curl dirmngr gnupg
sudo sh -c 'echo "deb http://deb.debian.org/debian $(lsb_release -sc) main contrib non-free" >> /etc/apt/sources.list.d/debian.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
sudo apt update
sudo apt install openjdk-17-jdk -y
sudo apt install git tmux cifs-utils -y
