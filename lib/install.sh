#!/bin/bash
wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.deb
cd ..
sudo yum install lib/jdk-20_linux-x64_bin.deb
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-20/bin/java 1
sudo update-alternatives --install /usr/bin/java javac /usr/lib/jvm/jdk-20/bin/javac 1
sudo update-alternatives --install /usr/bin/java jar /usr/lib/jvm/jdk-20/bin/jar 1
sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config jar
