#!/bin/bash
apt update && upgrade -y
apt install git zip unzip tmux -y
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java ${JAVA_VERSION} 
sdk use java ${JAVA_VERSION}
