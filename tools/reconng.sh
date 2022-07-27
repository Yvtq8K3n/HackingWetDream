#!/bin/bash
TARGET_DOMAIN=$1
echo $TARGET_DOMAIN

cd ~/tools
git clone https://github.com/lanmaster53/recon-ng.git
export PATH=$PATH:~/tools/recon-ng

#Use amass
#amass enum -d $TARGET_DOMAIN
