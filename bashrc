source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/config

if [ -f ~/dotfiles/bash/localrc ]; then
    source ~/dotfiles/bash/localrc
fi

if [ -d ~/.rvm/bin ]; then
    PATH=$PATH:~/.rvm/bin
fi
