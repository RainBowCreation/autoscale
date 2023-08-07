#!/bin/bash

# generate random id
MULTIPAPER_NODE_NAME=$(cat /proc/sys/kernel/random/uuid)

# start multipaper node
java -DbungeecordName=$MULTIPAPER_NODE_NAME -Dproperties.max-player=10 -Dproperties.difficulty=hard -DmultipaperMasterAddress=vocanicz.thddns.net:2997 -Dmultipaper -Xmx4G -Xms64m -jar multipaper-1.19.2-37.jar --nogui #-Dspigot.settings.bungeecord=true
