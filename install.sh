

## Install APT Packages
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    hardinfo \
    xorg-video-abi-23 \
    xserver-xorg-video-dummy \
    vim \
    git \
    screen \
    wget \
    apt-transport-https \
    software-properties-common

sudo cp bin/* /usr/local/bin


## Install Convenient Dotfiles
git submodule init
git submodule update
cp -r ./dots/.[^.]* ${HOME}


## Set up Remote Access Configs
sudo mkdir -p /usr/local/lib/xdisplay
sudo cp ./lib/* /usr/local/lib/xdisplay

mkdir -p ${HOME}/Downloads
wget -P ${HOME}/Downloads/ https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo chmod 664 ${HOME}/Downloads/teamviewer*
