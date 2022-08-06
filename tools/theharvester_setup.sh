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

    #Since theHarvester has the paths hardcoded i just replaced them:) to point to the right direction, h5! :)
    sed -i "s@\/etc\/theHarvester\/@$HOME/tools/TheHarvester\/@g" ~/tools/TheHarvester/theHarvester/lib/core.py
fi
echo "TheHarvester is ready to be use"

