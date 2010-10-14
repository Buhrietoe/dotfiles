#!/bin/bash

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls --color=auto'
alias l='ls -AFhl'
export EDITOR='vim'

# Prompt
CLR_GRAY='\[\e[30;1m\]'
CLR_RED='\[\e[31;1m\]'
CLR_GREEN='\[\e[32;1m\]'
CLR_YELLOW='\[\e[33;1m\]'
CLR_BLUE='\[\e[34;1m\]'
CLR_PURPLE='\[\e[35;1m\]'
CLR_CYAN='\[\e[36;1m\]'
CLR_WHITE='\[\e[37;1m\]'
CLR_RESET='\[\e[0m\]'
export PS1="$CLR_WHITE[$CLR_CYAN\u$CLR_WHITE@$CLR_GRAY\h$CLR_WHITE:$CLR_GREEN\w$CLR_WHITE]$CLR_GRAY\$ $CLR_RESET"
