# == Profiling start ==
# PS4='+ $EPOCHREALTIME\011 '
# exec 5> command.txt
# BASH_XTRACEFD="5"
# set -x

# bash only commands
shopt -s histappend
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/config
source ~/dotfiles/bash/completion
source ~/dotfiles/bash/contentful
source ~/.profile

if [ -f ~/dotfiles/bash/localrc ]; then
    source ~/dotfiles/bash/localrc
fi

eval "$(starship init bash)"
# == Profiling ends ==
# set +x
