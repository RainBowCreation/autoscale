#!/bin/bash

# resync plugin folder to only download
rm -rf plugins

# generate random id
NODE_NAME=$(cat /proc/sys/kernel/random/uuid)

# start multipaper node
java ${JAVA_OPTS} -jar Magma-1.12.2-47c7ac0b.jar --nogui
