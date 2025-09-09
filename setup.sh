#!/bin/bash
# check if not running in AWS
echo checking AWS
if [ "$AWS" != true ] ; then
	echo not in AWS
	# Always have a HOME for non-login shells
	export HOME=/root
	cd /root

	# Pick package manager
	if command -v dnf >/dev/null 2>&1; then PM=dnf
	elif command -v yum >/dev/null 2>&1; then PM=yum
	elif command -v apt-get >/dev/null 2>&1; then PM=apt-get
	else
		echo "No supported package manager found" >&2
		exit 1
	fi

	# Update and install deps
	case "$PM" in
		dnf)      $PM -y install git jq ;;
		yum)      $PM -y install git jq ;;
		apt-get)  $PM update -y && $PM install -y git jq ;;
	esac
	export AWS=false

	# Ensure scripts are executable
	chmod +x load_config.sh setup.sh

	# Load config (expects the script to echo lines like: export FOO=bar)
	export CONFIG_FILE=config.json
	eval "$("./load_config.sh")"

	# override config using `export KE=VALUE`` example `export JAVA_VERSION=11.0.18-zulu`
else
	echo in AWS
fi

#download lib
echo downloading lib..
cd lib
chmod +x install.sh
./install.sh
cd ..
echo downloaded lib..

#download multipapernode 1.19.2-37
echo downloading node..
cd node
chmod +x install.sh
./install.sh
chmod +x start.sh
echo downloaded node.
echo setup complete.. starting server..
tmux start-server
tmux new -d -s server
tmux send-keys -t server "./start.sh" C-m
