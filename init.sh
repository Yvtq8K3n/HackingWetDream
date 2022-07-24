#!/bin/bash
TMUX_CORE="https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/b855fe0086ed0b849ba1845097b4481a7e034448/.tmux.conf"
TMUX_VPN="https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/b855fe0086ed0b849ba1845097b4481a7e034448/vpn.sh"

curl -L $TMUX_CORE -o .tmux.conf
chmod +x .tmux.conf

#Creates initial stucture
mkdir -p ~/Projects
mkdir -p ~/Scripts

#Enter Scripts folder
cd ~/Scripts
curl -L $TMUX_VPN -o vpn.sh
curl -L https://github.com/Yvtq8K3n/HackingWetDream/archive/refs/heads/main.tar.gz | tar xz --wildcards "*/Scripts/*" --strip-components 2
