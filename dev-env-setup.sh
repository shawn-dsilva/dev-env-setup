#!/bin/bash

sudo apt install git vim  python3 python3-pip gcc-arm-none-eabi gdb-multiarch build-essential \
flex bison libgmp3-dev libmpfr-dev libncurses5-dev libmpc-dev autoconf chrome-gnome-shell texinfo \
libftdi-dev python-yaml zlib1g-dev arc-theme minicom putty curl gnome-shell-extensions gnome-tweak-tool libusb-1.0-0-dev \

#Chrome install
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
sudo apt install google-chrome-stable

#VScode install
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code

#nodeJS Install
wget -qO- https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

#lm4flash install
git clone https://github.com/utzig/lm4tools.git
cd lm4tools/lm4flash
make
sudo cp lm4flash /usr/bin/

#OpenOCD install
git clone git://git.code.sf.net/p/openocd/code openocd.git
cd openocd.git
./bootstrap
./configure --prefix=/usr --enable-maintainer-mode --enable-stlink --enable-ti-icdi
make
sudo make install

#Paper icon theme install
sudo add-apt-repository -u ppa:snwh/ppa
sudo apt-get install paper-icon-theme

