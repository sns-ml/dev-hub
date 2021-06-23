

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
    vim \
    git \
    screen \
    wget \
    apt-transport-https \
    software-properties-common
sudo apt autoremove -y

sudo cp bin/* /usr/local/bin

## Install Convenient Dotfiles
git submodule init
git submodule update
cp -r ./dots/.[^.]* ${HOME}
