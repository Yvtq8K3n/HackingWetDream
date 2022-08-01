#!/bin/bash
TMUX_CORE="https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/19d6531bd14da1443b0ef63866a506857161d42d/.tmux.conf"
TMUX_VPN="https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/19d6531bd14da1443b0ef63866a506857161d42d/vpn.sh"
GIT_CORE="https://github.com/Yvtq8K3n/HackingWetDream/archive/refs/heads/main.tar.gz"
API_CONFIG_FILE="https://github.com/Yvtq8K3n/HackingWetDream/raw/main/config.yaml"

printf "#Installing clipboard utils for smooth tmux experience\n\n"
sudo apt -y update
sudo apt -y install xclip

#Creates initial stucture
printf "\n#Creating initial stucture\n"
mkdir -p ~/projects
mkdir -p ~/scripts
mkdir -p ~/tools
mkdir -p ~/templates

printf " -Retreiving tmux conf from: ${TMUX_CORE}\n"
curl -L $TMUX_CORE -o ~/.tmux.conf --fail --silent --show-error
chmod +x ~/.tmux.conf

#Enter Scripts folder
printf "\n#Entering scripts folder\n"
cd ~/scripts

printf " -Retreiving vpn script for tmux from: ${TMUX_VPN}\n"
curl -L $TMUX_VPN -o vpn.sh --fail --silent --show-error

printf " -Retreiving all scripts from GIT: ${GIT_CORE}\n"
curl -s -L $GIT_CORE --fail --silent --show-error | tar xz --wildcards "*/scripts/*" --strip-components 2
printf " -Granting executable permission to all scripts\n"
chmod +x *

#Enter tools folder
printf "\n#Entering tools folder\n"
cd ~/tools
printf " -Retreiving all tool_scripts from GIT: ${GIT_CORE}\n"
curl -s -L $GIT_CORE --fail --silent --show-error | tar xz --wildcards "*/tools/*" --strip-components 2

printf " -Exporting tools folder to path\n"
echo "export PATH=$PATH:~/tools" >> ~/.profile
source ~/.profile

printf " -Granting executable permission to all tools\n"
chmod +x *

#Entering templates folder
printf "\n#Entering tools folder\n"
cd ~/templates
printf " -Retreiving all tool_templates from GIT: ${GIT_CORE}\n"
curl -s -L $GIT_CORE --fail --silent --show-error | tar xz --wildcards "*/templates/*" --strip-components 2

#Entering templates folder
printf "\n #Retreiving config file"
cd ~
printf " -Retreiving a sample of config file from GIT: ${GIT_CORE}\n"
curl -s -L $API_CONFIG_FILE --fail --silent --show-error -o config.yaml



