#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
cd ~/Downloads

# Spotify
sudo snap install spotify
# Gitkraken
sudo snap install --classic gitkraken
# Skype
sudo snap install --classic skype
# VS Code
sudo snap install --classic code

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

# Hyper
sudo apt install gdebi -y
wget https://hyper-updates.now.sh/download/linux_deb
sudo gdebi linux_deb

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

# maven
sudo apt install maven -y

# zsh
sudo apt install zsh -y
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
# jump
git clone git://github.com/wting/autojump.git
cd autojump
bash ./install.py
#
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# ubuntu
sudo add-apt-repository universe -y
sudo apt install gnome-tweak-tool -y
sudo apt install gnome-sushi -y

# finish
sudo apt autoremove -y
sudo apt upgrade -y