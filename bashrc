source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/env
source ~/dotfiles/bash/completions
source ~/dotfiles/bash/config

if [ -f ~/dotfiles/bash/localrc ]; then
    source ~/dotfiles/bash/localrc
fi
