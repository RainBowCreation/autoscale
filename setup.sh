#!/bin/bash
function run(){
	chmod +x install.sh
	./install.sh
}
cd lib
run
cd ..
cd node
#download multipapernode 
run
chmod +x start.sh
tmux start-server
tmux new -d -s server
tmux send-keys -t server "./start.sh" C-m
