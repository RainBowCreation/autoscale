#!/bin/bash

# resync plugin folder to only download
echo "syncing plugin.."
rm -rf plugins

# generate random id
echo "Generating node uuid.."
MULTIPAPER_NODE_NAME=$(cat /proc/sys/kernel/random/uuid)
echo "node uuid set to $MULTIPAPER_NODE_NAME"

# start multipaper node
java -Dmultipaper.master-connection.master-address=vocanicz.thddns.net:2997 -Dmultipaper.master-connection.my-name=$MULTIPAPER_NODE_NAME ${JAVA_OPTS} -jar multipaper-1.19.2-37.jar --nogui
