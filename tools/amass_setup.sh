#!/bin/bash
cd ~/tools

#Sourcing profile
source ~/.profile

if ! command -v amass &> /dev/null
then
    echo "Amass not found, proceeding to install it"
    #Create go 
    rm -rf ~/tools/go
    curl -L https://go.dev/dl/go1.18.4.linux-amd64.tar.gz -o go.tar.gz
    tar xvf go.tar.gz
    export PATH=~/tools/go/bin:$PATH

    #Install amass
    go install -v github.com/OWASP/Amass/v3/...@master
    ln -s ~/go/bin/amass amass

    #Use amass
    amass enum -d $TARGET_DOMAIN
fi
echo "Amass is ready to be use"
