# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus

xmodmap ~/.Xmodmap

. /usr/share/autojump/autojump.sh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# change default speaker to monitor
# pactl set-default-sink 'alsa_output.pci-0000_07_00.1.hdmi-stereo'

# start BT
# blueman-applet

# reset font scale
gsettings set org.gnome.desktop.interface text-scaling-factor 1.01
gsettings set org.gnome.desktop.interface text-scaling-factor 1.01
gsettings set org.gnome.desktop.interface text-scaling-factor 1.00

# aliases
alias c="code ."