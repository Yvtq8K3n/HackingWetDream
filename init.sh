#!/bin/bash
TMUX_CORE = https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/3becbcbe9d47447af7539f2e0f34e28d9aa6f141/.tmux.conf
TMUX_VPN = https://gist.githubusercontent.com/Yvtq8K3n/fb7b9590aca6a67b7a023d4faa4540b4/raw/3becbcbe9d47447af7539f2e0f34e28d9aa6f141/vpn.sh

curl -L $TMUX_CORE -o .tmux.conf
chmod +x .tmux.conf

#Creates initial stucture
mkdir -p ~/Projects
mkdir -p ~/Scripts

#Enter Scripts folder
cd ~/Scripts
curl -L $TMUX_VPN -o vpn.sh
curl -L https://github.com/Yvtq8K3n/HackingWetDream/archive/refs/heads/main.tar.gz | tar xz --wildcards "*/Scipts" --strip-components=3
