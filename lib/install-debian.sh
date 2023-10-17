#!/bin/bash

sudo apt update
sudo apt install software-properties-common -y
sudo apt install apt-transport-https lsb-release ca-certificates curl dirmngr gnupg
sudo apt-add-repository -y 'deb http://security.debian.org/debian-security stretch/updates main'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
sudo apt update
sudo apt install git tmux cifs-utils -y
sudo tar -xf OpenJDK8U-jdk_x64_linux_hotspot_8u382b05.tar.gz
export PATH=$PATH:/share/RainBowCreation/autoscale/lib/jdk8u382-b05/bin
