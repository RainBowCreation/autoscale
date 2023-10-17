#!/bin/bash

# generate random id
NODE_NAME=$(cat /proc/sys/kernel/random/uuid)

# start multipaper node
java ${JAVA_OPTS} -jar Magma-1.12.2-7d6be591.jar --nogui
