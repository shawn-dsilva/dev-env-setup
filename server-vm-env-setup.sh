#!/bin/bash

sudo apt install git vim gcc g++ make curl python3 python3-pip gcc-arm-none-eabi gdb-multiarch build-essential ubuntu-make \
flex bison libgmp3-dev libmpfr-dev libncurses5-dev libmpc-dev autoconf libtool texinfo \
libftdi-dev python-yaml zlib1g-dev apt-transport-https ca-certificates  software-properties-common deluge fonts-firacode
zsh \

#nodeJS repo
wget -qO- https://deb.nodesource.com/setup_10.x | sudo -E bash -

#Docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

#MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# Apt update and installs

sudo apt update -y
sudo apt install  -y nodejs  mongodb-org docker-ce

#OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#npm global installs
sudo npm install -g typescript
sudo npm install -g @angular/cli
sudo npm install -g nodemon


#startup

sudo systemctl start mongod
sudo systemctl enable mongod