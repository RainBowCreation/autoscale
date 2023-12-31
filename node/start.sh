#!/bin/bash

# resync plugin folder to only download
echo "syncing plugin.."
rm -rf plugins
echo "syncing world.."
rm -rf world*

# generate random id
echo "Generating node uuid.."
MULTIPAPER_NODE_NAME=$(cat /proc/sys/kernel/random/uuid)
echo "node uuid set to $MULTIPAPER_NODE_NAME"

# start multipaper node
java ${NODE_ARGS} -Dproperties.server-port=$PORT -Dmultipaper.master-connection.my-name=$MULTIPAPER_NODE_NAME ${JAVA_OPTS} -jar node.jar
