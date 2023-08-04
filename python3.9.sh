#!/bin/bash
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

echo -e "${BGreen}sudo apt update${Color_Off}"
sudo apt update
echo -e "${BPurple}sudo apt install software-properties-common -y${Color_Off}"
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
echo -e "${BWhite}sudo apt install python3.9 python3.9-dev -y${Color_Off}"
sudo apt install python3.9 python3.9-dev -y
echo -e "${BGreen}sudo apt install python3-pip -y${Color_Off}"
sudo apt install python3-pip -y
echo -e "${BYellow}sudo update-alternatives --install${Color_Off}"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
echo -e "${BPurple}sudo update-alternatives --config python"
sudo update-alternatives --config python
echo -e "${BGreen}sudo apt install python3.9-distutils${Color_Off}"
# ModuleNotFoundError: No module named 'distutils.util'
sudo apt install python3.9-distutils -y

echo -e "${BRed}python3 --version"
python3 --version
python --version
pip3 --version
pip --version
echo -e "${Color_Off}"

echo -e "${BGreen}ImportError: cannot import name '_gi' from partially initialized module 'gi'"
sudo apt install libgirepository1.0-dev gcc libcairo2-dev pkg-config python3-dev gir1.2-gtk-3.0
sudo python3.9 -m pip install --ignore-installed PyGObject

# ModuleNotFoundError: No module named 'apt_pkg'
echo -e "${BYellow}sudo apt remove python3-apt"
sudo apt remove python3-apt
echo -e "sudo apt install python3-apt"
sudo apt install python3-apt