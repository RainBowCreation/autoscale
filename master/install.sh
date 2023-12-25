#!/bin/bash
wget https://api.multipaper.io/v2/projects/multipaper/versions/1.20.1/builds/14/downloads/multipaper-master-2.11.0-all.jar
git clone "https://github.com/RainBowCreation/world.git"
mv multipaper-master-2.11.0-all.jar master.jar
