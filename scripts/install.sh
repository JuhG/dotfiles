#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y build-essential curl file
cd $HOME/Downloads



# # # # # #
# Terminal
# # # # # #

# Zsh & oh-my-zsh
cp $HOME/dotfiles/.oh-my-zsh/themes/robbyrussell.zsh-theme $HOME/.oh-my-zsh/themes/
# Jump
sudo apt install -y python
git clone git://github.com/wting/autojump.git
python ./autojump/install.py
# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Apps
sudo apt install -y vim
sudo apt install -y htop

# Hyper
wget https://github.com/vercel/hyper/releases/download/3.0.2/hyper_3.0.2_amd64.deb
sudo apt install -y ./hyper_3.0.2_amd64.deb

# Settings
bash $HOME/dotfiles/scripts/symlink.sh



# # # # # #
# Docker
# # # # # #
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt install -y docker-ce docker-ce-cli containerd.io
# docker extra
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
# docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



# # # # # #
# Languages
# # # # # #

# Node & npm
curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm i -g rebase-editor
sudo npm i -g npm-check-updates
sudo npm i -g @nestjs/cli
sudo npm i -g blitz
sudo npm i -g vercel

# Maven
sudo apt install -y maven

# PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt install -y php8.0 php8.0-fpm
sudo apt install -y openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip
sudo apt install -y php8.0-common php8.0-bcmath php8.0-mbstring php8.0-gd php8.0-intl php8.0-xsl
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --filename=composer
sudo mv composer /usr/local/bin/
composer global require laravel/installer



# # # # # #
# Apps
# # # # # #

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

# Spotify
sudo snap install spotify

# Gitkraken
sudo snap install --classic gitkraken

# Skype
sudo snap install --classic skype

# VS Code
sudo snap install --classic code
sudo apt install -y fonts-firacode

# Postman
sudo snap install postman

# Tableplus
wget -O - -q http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
sudo apt install -y tableplus

# Teams
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
sudo apt install -y ./teams_1.3.00.5153_amd64.deb

# Dockstation
wget https://github.com/DockStation/dockstation/releases/download/v1.5.1/dockstation_1.5.1_amd64.deb
sudo apt install -y ./dockstation_1.5.1_amd64.deb

# Lotion
sudo apt install -y p7zip-full
wget https://raw.githubusercontent.com/puneetsl/lotion/master/setup.sh
bash setup.sh native



# # # # # #
# Others
# # # # # #

# Autokey
sudo apt install -y autokey-gtk

# Ubuntu
sudo add-apt-repository -y universe
sudo apt install -y gnome-tweak-tool
sudo apt install -y gnome-sushi

# VPN
sudo apt install -y openconnect network-manager-openconnect-gnome

# Finish
sudo apt autoremove -y
sudo apt update -y
sudo apt upgrade -y

# Folders
mkdir -p $HOME/code/old
mkdir $HOME/work

# Languages
sudo cp $HOME/dotfiles/usr_share_X11_xkb_symbols/hu /usr/share/X11/xkb/symbols/
sudo cp $HOME/dotfiles/usr_share_X11_xkb_symbols/us /usr/share/X11/xkb/symbols/

# Bluetooth
sudo mkdir -p /lib/firmware/brcm/
sudo cp $HOME/dotfiles/bluetooth/BCM20702A1-0b05-17cb.hcd /usr/lib/firmware/brcm/BCM20702A1-0b05-17cb.hcd
sudo apt install -y blueman pulseaudio-module-bluetooth

# Audio
sudo apt install -y pavucontrol
