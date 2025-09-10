#!/bin/bash
echo "downloading multipaper-master.."
wget https://repo.rainbowcreation.net/files/jar/autoscale_utils/multipaper-master.jar
mv multipaper-master.jar master.jar
echo "downloading plugins.."
cd synced-server-files
mkdir plugins
cd plugins
wget https://repo.rainbowcreation.net/files/jar/autoscale_utils/ViaVersion.jar
wget https://repo.rainbowcreation.net/files/jar/autoscale_utils/PlaceholderAPI.jar
wget https://repo.rainbowcreation.net/files/jar/autoscale_utils/ProtocalLib.jar
wget https://repo.rainbowcreation.net/files/jar/autoscale_utils/Vault.jar
wget https://repo.rainbowcreation.net/files/jar/autoscale_utils/Regionerator.jar
wget https://repo.rainbowcreation.net/files/jar/autoscale_utils/CloudWatch.jar
wget https://repo.rainbowcreation.net/files/jar/autoscale_utils/RainBowCreation-bootstrap.jar
cd ../..
echo "done"