#!/bin/bash
TMUX_CORE="https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/b855fe0086ed0b849ba1845097b4481a7e034448/.tmux.conf"
TMUX_VPN="https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/b855fe0086ed0b849ba1845097b4481a7e034448/vpn.sh"
GIT_CORE="https://github.com/Yvtq8K3n/HackingWetDream/archive/refs/heads/main.tar.gz"

sudp apt -y update
sudo apt -y install xclip

#Creates initial stucture
printf "#Creating initial stucture\n"
mkdir -p ~/projects
mkdir -p ~/scripts
mkdir -p ~/tools

printf " -Retreiving tmux conf from: ${TMUX_CORE}\n"
curl -L $TMUX_CORE -o .tmux.conf --fail --silent --show-error
chmod +x .tmux.conf

#Enter Scripts folder
printf "\n#Entering scripts folder\n"
cd ~/scripts

printf " -Retreiving vpn script for tmux from: ${TMUX_VPN}\n"
curl -L $TMUX_VPN -o vpn.sh --fail --silent --show-error

printf " -Retreiving all scripts from GIT: ${GIT_CORE}\n"
curl -s -L $GIT_CORE --fail --silent --show-error | tar xz --wildcards "*/scripts/*" --strip-components 2
chmod +x *

#Enter tools folder
printf "\n#Entering tools folder\n"
cd ~/tools
printf " -Retreiving all tool_scripts from GIT: ${GIT_CORE}\n"
curl -s -L $GIT_CORE --fail --silent --show-error | tar xz --wildcards "*/tools/*" --strip-components 2

