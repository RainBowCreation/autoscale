#!/bin/bash

# resync plugin folder to only download
rm -rf plugins

# generate random id
MULTIPAPER_NODE_NAME=$(cat /proc/sys/kernel/random/uuid)

# start multipaper node
java -Dmultipaper.master-connection.master-address=${MASTER_ADDRESS} -Dmultipaper.master-connection.my-name=$MULTIPAPER_NODE_NAME ${JAVA_OPTS} -jar node.jar --nogui
