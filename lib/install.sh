#!/bin/bash
 sudo rpm --import https://yum.corretto.aws/corretto.key 
 sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
 sudo yum install -y java-20-amazon-corretto-devel
 sudo alternatives --config java 1
 sudo yum install tmux -y