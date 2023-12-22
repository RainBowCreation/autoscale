#!/bin/bash
echo "downloading multipaper1.20.1.."
wget https://api.multipaper.io/v2/projects/multipaper/versions/1.20.1/builds/14/downloads/multipaper-1.20.1-14.jar
echo "change filename to node.jar"
mv multipaper-1.20.1-14.jar node.jar
echo "done"
