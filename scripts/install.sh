# zsh
brew install zsh
brew install zsh-autosuggestions
brew install autojump

# fix dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock
