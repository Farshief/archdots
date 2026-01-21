#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoredups

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Set up config alias for tracking dotfiles
alias config='/usr/bin/git --git-dir=/home/varyshen/.cfg/ --work-tree=/home/varyshen'

# Activate Starship
eval "$(starship init bash)"
