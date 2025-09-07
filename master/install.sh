#!/bin/bash
echo "downloading multipaper-master.."
wget https://api.multipaper.io/v2/projects/multipaper/versions/1.20.1/builds/60/downloads/multipaper-master-2.12.3-all.jar
mv multipaper-master-2.12.3-all.jar master.jar
echo "downloading plugins.."
cd synced-server-files
mkdir plugins
cd plugins
wget https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.4.2/PAPER/ViaVersion-5.4.2.jar
wget https://repo.rainbowcreation.net/files/Vault.jar
wget https://repo.rainbowcreation.net/files/RainBowCreation-bootstrap.jar
cd ../..
echo "done"