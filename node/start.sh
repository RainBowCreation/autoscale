#!/bin/bash

# generate random id
MULTIPAPER_NODE_NAME=$(cat /proc/sys/kernel/random/uuid)

# start multipaper node
java -Dmultipaper.master-connection.master-address=vocanicz.thddns.net:2997 -Dmultipaper.master-connection.my-name=$MULTIPAPER_NODE_NAME -Xmx4G -Xms64m -jar multipaper-1.19.2-37.jar --nogui
