#!/bin/bash

sudo apt install git vim gcc g++ make curl python3 python3-pip gcc-arm-none-eabi gdb-multiarch build-essential ubuntu-make \
flex bison libgmp3-dev libmpfr-dev libncurses5-dev libmpc-dev autoconf libtool texinfo \
libftdi-dev python-yaml zlib1g-dev minicom putty libusb-1.0-0-dev  apt-transport-https ca-certificates  software-properties-common deluge fonts-firacode
zsh \

#Chrome repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#VScode repo
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#nodeJS repo
wget -qO- https://deb.nodesource.com/setup_10.x | sudo -E bash -

#Docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

#MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

#Paper icon theme repo
sudo add-apt-repository -u ppa:snwh/ppa -y


# Apt update and installs

sudo apt update -y
sudo apt install  -y google-chrome-stable nodejs code mongodb-org 


#IntelliJ

umake ide idea

#Postman install

wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman

#OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


#npm global installs

sudo npm install -g @angular/cli
sudo npm install -g typescript
sudo npm install -g eslint
sudo npm install -g tslint
sudo npm install -g nodemon


#VScode extensions install

code --install-extension azemoh.one-monokai
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension eg2.tslint
code --install-extension Equinusocio.vsc-material-theme
code --install-extension HookyQR.beautify
code --install-extension ms-azuretools.vscode-cosmosdb
code --install-extension ms-python.python
code --install-extension ms-vscode.azure-account
code --install-extension PeterJausovec.vscode-docker
code --install-extension PKief.material-icon-theme
code --install-extension shakram02.bash-beautify
code --install-extension zhuangtongfa.Material-theme

#Oh my Zsh spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#OpenOCD install
git clone git://git.code.sf.net/p/openocd/code openocd.git
cd openocd.git
./bootstrap
./configure --prefix=/usr --enable-maintainer-mode --enable-stlink --enable-ti-icdi
make
sudo make install

#Konsole colorschemes
cp * KonsoleColorschemes/ ~/.local/share/konsole
