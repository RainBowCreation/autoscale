#!/bin/bash
sudo yum install tmux zip unzip -y
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java "$JAVA_VERSION"-amzn
sdk use java "$JAVA_VERSION"-amzn