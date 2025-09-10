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
	# Fetch IMDSv2 token and query once
	TOKEN=$(curl -fsS -X PUT "http://169.254.169.254/latest/api/token" \
	-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

	REGION=$(curl -fsS -H "X-aws-ec2-metadata-token: $TOKEN" \
	http://169.254.169.254/latest/meta-data/placement/region) 

	INSTANCE_ID=$(curl -fsS -H "X-aws-ec2-metadata-token: $TOKEN" \
	http://169.254.169.254/latest/meta-data/instance-id)

	unset TOKEN           # optional: don’t keep token around

	REGION=$(echo $REGION | cut -d'-' -f1)
	INSTANCE_ID=$(echo $INSTANCE_ID | cut -d'-' -f2-)
	export REGION INSTANCE_ID

	# sanity check — these are now literal strings in THIS shell
	echo "$REGION"
	echo "$INSTANCE_ID"
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
echo setup complete..
echo createing tmux session..
tmux new -d -s server
echo starting server..
tmux send-keys -t server "./start.sh" C-m
echo server started.
