#!/bin/bash

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls --color=auto'
alias l='ls -AFhl --group-directories-first'
alias t='tail -f /var/log/messages.log'
alias pacup='sudo pacman -Syu'
alias yumup='sudo yum upgrade'
alias xx='exit'
export TERM='xterm'
export EDITOR='vim'
PATH=~/scripts:$PATH
export PATH
#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Prompt colors
CLR_GRAY='\[\e[30;1m\]'
CLR_RED='\[\e[31;1m\]'
CLR_GREEN='\[\e[32;1m\]'
CLR_YELLOW='\[\e[33;1m\]'
CLR_BLUE='\[\e[34;1m\]'
CLR_PURPLE='\[\e[35;1m\]'
CLR_CYAN='\[\e[36;1m\]'
CLR_WHITE='\[\e[37;1m\]'
CLR_RESET='\[\e[0m\]'

# Prompt function
function set_prompt() {

  # Git branch / dirtiness
  if git update-index -q --refresh 2>/dev/null; git diff-index --quiet --cached HEAD --ignore-submodules -- 2>/dev/null && git diff-files --quiet --ignore-submodules 2>/dev/null
    then dirty=""
  else
    dirty="${CLR_RED}*"
  fi

  _branch=$(git symbolic-ref HEAD 2>/dev/null)
  _branch=${_branch#refs/heads/}
  branch="" # need this to clear it when we leave a repo
  if [[ -n $_branch ]]; then
    branch="${CLR_WHITE}[${CLR_PURPLE}${_branch}${dirty}${CLR_WHITE}]"
  fi

  export PS1="$CLR_CYAN\u$CLR_WHITE@$CLR_GRAY\h$CLR_WHITE:$CLR_GREEN\w${branch}$CLR_GRAY\$ $CLR_RESET"

}
export PROMPT_COMMAND=set_prompt
