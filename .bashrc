#!/bin/bash

# bash options
# notify of background process completion
set -b

# set vi editing mode
set -o vi

# wrap text properly if term size changes
shopt -s checkwinsize

# try to correct typing mistakes on directories
shopt -s cdspell
shopt -s dirspell

# aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls --color=auto'
alias l='ls -AFhls --group-directories-first'
alias ll='ls -AFhls --group-directories-first | less'
alias t='tail -f /var/log/messages.log'
alias pu='nice pacaur -Syu'
alias yup='sudo nice yum upgrade'
alias gup='sudo nice emerge --update --deep --with-bdeps=y --newuse --ask world'
alias aup='sudo nice apt-get update && sudo apt-get dist-upgrade'
alias py='source ~/py/bin/activate && echo Python environment activated'

# modify path to include home scripts
PATH=~/scripts:$PATH

# exports
export PATH
export TERM='urxvt'
export EDITOR='vim'

# Prompt colors
CLR_GRAY='\[\e[30m\]'
CLR_RED='\[\e[31m\]'
CLR_GREEN='\[\e[32m\]'
CLR_YELLOW='\[\e[33m\]'
CLR_BLUE='\[\e[34m\]'
CLR_PURPLE='\[\e[35m\]'
CLR_CYAN='\[\e[36m\]'
CLR_WHITE='\[\e[37m\]'
CLR_RESET='\[\e[0m\]'

# Prompt function that shows current git branch and dirty status
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

  export PS1="$CLR_GREEN\u$CLR_WHITE@$CLR_CYAN\h$CLR_WHITE:$CLR_YELLOW\w${branch}$CLR_CYAN# $CLR_RESET"

}
export PROMPT_COMMAND=set_prompt
