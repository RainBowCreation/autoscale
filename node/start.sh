#!/bin/bash

# resync plugin folder to only download
echo "syncing plugin.."
rm -rf plugins
echo "syncing world.."
rm -rf world*

MULTIPAPER_NODE_NAME=${REGION}-${INSTANCE_ID}
echo "node uuid set to $MULTIPAPER_NODE_NAME"

# start multipaper node
java ${NODE_ARGS} -Dproperties.server-port=$PORT -Dmultipaper.master-connection.master-address=$MASTER_ADDRESS -Dmultipaper.master-connection.my-name=$MULTIPAPER_NODE_NAME -Dproperties.motd=${MOTD} -Dproperties.online-mode=${ONLINE_MODE} -Dproperties.max-players=${MAX_PLAYERS} ${JAVA_OPTS} --add-modules=jdk.incubator.vector -jar node.jar