#!/bin/bash

# generate random id
NODE_NAME=$(cat /proc/sys/kernel/random/uuid)

# start multipaper node
java ${JAVA_OPTS} -jar Magma-1.19.3-44.1.23-6e6ce905-server.jar --nogui
