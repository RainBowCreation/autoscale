#!/bin/bash
case "$PM" in
    dnf)      $PM -y install zip unzip tmux wget ;;
    yum)      $PM -y install zip unzip tmux wget ;;
    apt-get)  $PM update -y && $PM install -y zip unzip tmux wget ;;
esac
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java ${JAVA_VERSION} 
sdk use java ${JAVA_VERSION}