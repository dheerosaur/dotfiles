export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/config
source ~/dotfiles/bash/completion
source ~/.profile

if [ -f ~/dotfiles/bash/localrc ]; then
    source ~/dotfiles/bash/localrc
fi
