#!/bin/bash

# start
sudo apt update -y
sudo apt upgrade -y
cd $HOME/Downloads

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

# Spotify
sudo snap install spotify
# Gitkraken
sudo snap install --classic gitkraken
# Skype
sudo snap install --classic skype
# VS Code
sudo snap install --classic code

# Hyper
wget https://github.com/vercel/hyper/releases/download/3.0.2/hyper_3.0.2_amd64.deb
sudo apt install ./hyper_3.0.2_amd64.deb -y

# Autokey
sudo apt install autokey-gtk -y

# Teams
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
sudo apt install ./teams_1.3.00.5153_amd64.deb -y

# Tableplus
wget -O - -q http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
sudo apt install tableplus -y

# dockstation
sudo apt install docker.io docker-compose -y
sudo usermod -aG docker $USER
wget https://github.com/DockStation/dockstation/releases/download/v1.5.1/dockstation-1.5.1-x86_64.AppImage
chmod +x ./*.AppImage
mkdir -p $HOME/.local/share/appimagekit
touch $HOME/.local/share/appimagekit/no_desktopintegration
./dockstation-1.5.1-x86_64.AppImage

# node & npm
sudo apt install nodejs -y
sudo apt install npm -y
npm i -g rebase-editor
npx gatsby telemetry --disable

# maven
sudo apt install maven -y

# ubuntu
sudo add-apt-repository universe -y
sudo apt install gnome-tweak-tool -y
sudo apt install gnome-sushi -y

# VPN
sudo apt install openconnect network-manager-openconnect-gnome -y
nmcli con mod ICF vpn.secrets 'form:main:username=gabor.juhasz','save_passwords=yes'

# backup
sudo apt purge duplicity
sudo snap install duplicity --classic --edge
sudo snap install deja-dup --classic --edge

# finish
sudo apt autoremove -y
sudo apt upgrade -y

# set up folders
cd $HOME
mkdir -p code/old
mkdir work

# make sure GUI is loading
sudo systemctl set-default graphical.target

# zsh & oh-my-zsh
sudo apt install zsh -y
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
# jump
git clone git://github.com/wting/autojump.git
bash ./autojump/install.py
# plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting