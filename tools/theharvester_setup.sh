#!/bin/bash

#Sourcing profile
source ~/.profile

if ! command -v theharvester &> /dev/null
then
    echo "TheHarvester not found, proceeding to install it"
    cd ~/tools
    git clone https://github.com/laramies/theHarvester TheHarvester
    (cd TheHarvester && python3 -m pip install -r requirements/base.txt)
    ln -s ~/tools/TheHarvester/theHarvester.py theharvester
    sudo mkdir -p /etc/theHarvester
    sudo cp ~/tools/TheHarvester/proxies.yaml /etc/theHarvester/
fi
echo "TheHarvester is ready to be use"

