#!/bin/bash
sudo apt -y update

#Creates initial stucture
printf "\n#Creating initial stucture\n"
mkdir -p ~/projects
mkdir -p ~/scripts
mkdir -p ~/tools
mkdir -p ~/templates

export GIT_CORE="https://github.com/Yvtq8K3n/HackingWetDream/archive/refs/heads/main.tar.gz"
export API_CONFIG_FILE="https://github.com/Yvtq8K3n/HackingWetDream/raw/main/config.yaml"
export TMUX_CORE="https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/19d6531bd14da1443b0ef63866a506857161d42d/.tmux.conf"
export TMUX_VPN="https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/19d6531bd14da1443b0ef63866a506857161d42d/vpn.sh"
printf " -Retreiving tmux conf from: ${TMUX_CORE}\n"
curl -L $TMUX_CORE -o ~/.tmux.conf --fail --silent --show-error
chmod +x ~/.tmux.conf

printf " -Retreiving vpn script for tmux from: ${TMUX_VPN}\n"
(mkdir -p ~/scripts; cd ~/scripts; curl -L $TMUX_VPN -o vpn.sh --fail --silent --show-error; chmod +x vpn.sh)

printf "#Installing clipboard utils for smooth tmux experience\n\n"
sudo apt -y install xclip

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



