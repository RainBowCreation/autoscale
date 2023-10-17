#!/bin/bash
git clone -b "1.12.2" https://github.com/RainBowCreation/mods.git
git clone -b "1.12.2" https://github.com/RainBowCreation/world.git
wget https://git.magmafoundation.org/api/v4/projects/7/packages/maven/org/magmafoundation/Magma/1.12.2-7d6be591/Magma-1.12.2-7d6be591.jar
cd plugins
# wget https://github.com/ViaVersion/ViaVersion/releases/download/4.8.0/ViaVersion-4.8.0.jar
# wget https://github.com/ViaVersion/ViaBackwards/releases/download/4.8.0/ViaBackwards-4.8.0.jar
wget https://download.luckperms.net/1515/bukkit/loader/LuckPerms-Bukkit-5.4.102.jar
wget https://dev.bukkit.org/projects/vault/files/894359/download
wget https://github.com/NEZNAMY/TAB/releases/download/4.0.7/TAB.v4.0.7.jar
wget https://github.com/EssentialsX/Essentials/releases/download/2.20.1/EssentialsX-2.20.1.jar
wget https://github.com/EssentialsX/Essentials/releases/download/2.20.1/EssentialsXChat-2.20.1.jar
wget https://github.com/dmulloy2/ProtocolLib/releases/latest/download/ProtocolLib.jar
wget https://github.com/RainBowCreation/Core/releases/latest/download/RBCcore.jar
cd ..
wget https://github.com/RainBowCreation/auth/releases/latest/download/auth
echo "installation complete please run ./auth to authenticate your license"
echo "you can start the server using ./start.sh"
