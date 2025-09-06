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
java ${NODE_ARGS} -Dproperties.server-port=$PORT -Dmultipaper.master-connection.master-address=$MASTER_ADDRESS -Dmultipaper.master-connection.my-name=$MULTIPAPER_NODE_NAME -Dproperties.motd=${MOTD} -Dproperties.online-mode=${ONLINE_MODE} -Dproperties.max-players=${MAX_PLAYER} ${JAVA_OPTS} -jar node.jar
