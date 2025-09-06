#!/bin/bash
function install_lib(){
	cd lib
	if [ "$YUM" = true ] ; then
		chmod +x install_yum.sh
		./install_yum.sh
	else
		chmod +x install.sh
		./install.sh
	fi
	cd ..
}
install_lib
cd node
#download multipapernode 1.19.2-37
chmod +x install.sh
./install.sh
chmod +x start.sh
tmux start-server
tmux new -d -s server
tmux send-keys -t server "./start.sh" C-m
