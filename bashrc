source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/config
source ~/.profile

if [ -f ~/dotfiles/bash/localrc ]; then
    source ~/dotfiles/bash/localrc
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"
