#!/usr/bin/env bash

Color_Off='\033[0m'       # Text Reset
# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

echo -e "${BBlue}update.... apt${Color_Off}"
sudo apt-get update && sudo  apt-get install -y wget apt-utils lsb-release git build-essential && sudo  rm -rf /var/lib/apt/lists/*
OF_VERSION=0.11.0
echo -e "${BYellow}download openframework ${OF_VERSION}${Color_Off}"
wget http://openframeworks.cc/versions/v${OF_VERSION}/of_v${OF_VERSION}_linuxarmv7l_release.tar.gz

tar -xzvf of_v${OF_VERSION}_linuxarmv7l_release.tar.gz
mv of_v${OF_VERSION}_linuxarmv7l_release /home/spring/of

echo -e "${BYellow}download apothecary${Color_Off}"
cd /home/spring
git clone https://github.com/openframeworks/apothecary.git

cd /home/spring/apothecary/apothecary && \
    ./apothecary -t linux download kiss && \
    ./apothecary -t linux prepare kiss && \
    ./apothecary -t linux build kiss && \
    ./apothecary -t linux download tess2 && \
    ./apothecary -t linux prepare tess2 && \
    ./apothecary -t linux build tess2

cd /home/spring/apothecary/apothecary/ && \
cp build/kiss/lib/linux/libkiss.a /home/spring/of/libs/kiss/lib/linuxarmv7l/ && \
cp build/tess2_patched/build/libtess2.a /home/spring/of/libs/tess2/lib/linuxarmv7l/

echo -e "${BYellow}coding...${Color_Off}"
sed -i "41s/PLATFORM_CFLAGS/#PLATFORM_CFLAGS/" /home/spring/of/libs/openFrameworksCompiled/project/linuxarmv7l/config.linuxarmv7l.default.mk && \
sed -i "42s/PLATFORM_CFLAGS/#PLATFORM_CFLAGS/" /home/spring/of/libs/openFrameworksCompiled/project/linuxarmv7l/config.linuxarmv7l.default.mk && \
sed -i "43s/PLATFORM_CFLAGS/#PLATFORM_CFLAGS/" /home/spring/of/libs/openFrameworksCompiled/project/linuxarmv7l/config.linuxarmv7l.default.mk && \
sed -i "44s/PLATFORM_CFLAGS/#PLATFORM_CFLAGS/" /home/spring/of/libs/openFrameworksCompiled/project/linuxarmv7l/config.linuxarmv7l.default.mk && \
sed -i "69s/PLATFORM_PKG_CONFIG_LIBRARIES/#PLATFORM_PKG_CONFIG_LIBRARIES/" /home/spring/of/libs/openFrameworksCompiled/project/linuxarmv7l/config.linuxarmv7l.default.mk && \
sed -i "70s/PLATFORM_PKG_CONFIG_LIBRARIES/#PLATFORM_PKG_CONFIG_LIBRARIES/" /home/spring/of/libs/openFrameworksCompiled/project/linuxarmv7l/config.linuxarmv7l.default.mk && \
sed -i "71s/PLATFORM_PKG_CONFIG_LIBRARIES/#PLATFORM_PKG_CONFIG_LIBRARIES/" /home/spring/of/libs/openFrameworksCompiled/project/linuxarmv7l/config.linuxarmv7l.default.mk && \
sed -n "41,71p" /home/spring/of/libs/openFrameworksCompiled/project/linuxarmv7l/config.linuxarmv7l.default.mk && \
sed -i "89s/armv7l/aarch64/" /home/spring/of/libs/openFrameworksCompiled/project/makefileCommon/config.shared.mk && \
sed -n "89p" /home/spring/of/libs/openFrameworksCompiled/project/makefileCommon/config.shared.mk

echo -e "${BPurple}install_dependencies.sh${Color_Off}"
cd /home/spring/of/scripts/linux/ubuntu/ && sudo ./install_dependencies.sh -y && \
echo -e "${BPurple}compileOF.sh${Color_Off}"
cd /home/spring/of/scripts/linux/ && ./compileOF.sh -j3
echo -e "${BPurple}for zetaUron${Color_Off}"
sudo apt install libeigen3-dev -y # for zetaUron


# /usr/lib/aarch64-linux-gnu
