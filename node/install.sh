#!/bin/bash
echo "downloading multipaper1.20.1.."
wget https://api.multipaper.io/v2/projects/multipaper/versions/1.20.1/builds/60/downloads/multipaper-1.20.1-60.jar
mv multipaper-1.20.1-60.jar node.jar
echo "done"
