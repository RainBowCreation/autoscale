#!/bin/bash

# generate random id
MULTIPAPER_NODE_NAME=$(cat /proc/sys/kernel/random/uuid)

# start multipaper node
java -DbungeecordName=$MULTIPAPER_NODE_NAME -Dspigot.settings.bungeecord=true -Dproperties.server-port=25565 -DmultipaperMasterAddress=3.86.190.46:35353 -Xmx1G -Xms64m -jar multipaper-1.19.2-37.jar --nogui
