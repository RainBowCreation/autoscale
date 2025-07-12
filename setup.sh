#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
cd lib
chmod +x install.sh
./install.sh
cd ..
cd node
chmod +x install.sh
./install.sh
chmod +x start.sh
tmux start-server
tmux new -d -s server
tmux send-keys -t server "./start.sh" C-m
