#!/bin/bash
function run(){
	chmod +x install.sh
	./install.sh
}
cd lib
run
cd ..
cd node
#download multipapernode 1.19.2-37
chmod +x install.sh
./install.sh
chmod +x start.sh
tmux start-server
tmux new -d -s server
tmux send-keys -t server "./start.sh" C-m
