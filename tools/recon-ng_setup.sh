#!/bin/bash

#Sourcing profile
source ~/.profile

if ! command -v recon-ng &> /dev/null
then
    echo "Recon-ng not found, proceeding to install it"
    cd ~/tools
    git clone https://github.com/lanmaster53/recon-ng.git Recon-ng
    ln -s ~/tools/Recon-ng/recon-ng recon-ng
fi
echo "Recon-ng is ready to be use"

