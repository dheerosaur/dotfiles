shopt -s histappend

source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/config
source ~/dotfiles/bash/completion
source ~/.profile

if [ -f ~/dotfiles/bash/localrc ]; then
    source ~/dotfiles/bash/localrc
fi
