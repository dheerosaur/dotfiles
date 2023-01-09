shopt -s histappend

source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/config
source ~/dotfiles/bash/completion
source ~/.profile

if [ -f ~/dotfiles/bash/localrc ]; then
    source ~/dotfiles/bash/localrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PS1='$(__git_ps1 "[%s] ")\W \$ '
eval "$(starship init bash)"
. "$HOME/.cargo/env"
