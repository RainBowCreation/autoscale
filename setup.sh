#!/bin/bash
function run(){
	chmod +x install.sh
	./install.sh
}
cd lib
run
cd ..
cd master
#download multipapernode 
run
cd synced-server-files/plugins
run
cd ../../
chmod +x start.sh
tmux start-server
tmux new -d -s server
tmux send-keys -t server "./start.sh" C-m
