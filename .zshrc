export ZSH="/Users/gabor.juhasz/.oh-my-zsh"

ZSH_THEME="robbyrussell"

unsetopt correct_all

plugins=(git)

source $ZSH/oh-my-zsh.sh

# zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# fnm
eval "$(fnm env --use-on-cd --version-file-strategy recursive)"

# aliases
alias c="code ."
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias php="sail"
alias composer="sail composer"

# git get
function gg {
  # default to current branch
  BRANCH=$(git symbolic-ref --short -q HEAD)

  if [[ $(git diff --stat) != '' ]]; then
    git status --short

    echo -n "Continue? (y/n) "
    read ANSWER

    if [[ $ANSWER != "y" ]]; then
      return 0
    fi
  fi

  git reset --hard
  git fetch --all

  git checkout ${1:-$BRANCH}
  if [[ $? -eq 1 ]]; then
    echo "Branch doesn't exist!"
    return 0
  fi

  git pull

  code .
  PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm ci
}

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# nvm use
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
