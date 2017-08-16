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
alias l='ls -AFhl'
alias ll='ls -AFhl | less'
alias t='journalctl -n 20'
alias pu='nice pacaur -Syu'
alias yup='sudo nice yum upgrade'
alias gup='sudo nice emerge --update --deep --with-bdeps=y --newuse --ask world'
alias aup='sudo nice apt-get update && sudo apt-get dist-upgrade'
alias py='source ~/py/bin/activate && echo Python environment activated'
alias updatemirrors='sudo reflector -c "United States" -f 5 -p "http" --verbose --save /etc/pacman.d/mirrorlist'
alias pipup='pip freeze --local | grep -v "^\-e" | cut -d = -f 1 | xargs pip install --upgrade'
alias purgeswap='sudo swapoff -a && sudo swapon -a'
alias webcam='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 30'
alias screenoff='sleep 1 && xset dpms force off'
alias nobs='sed "/^ *$/d;/^ *#/d"'
alias dvi='dockviz images --tree -i'
alias dr='docker run -it --rm'
alias di='docker images'
alias dp='docker ps -a'
alias ds='docker stack'

# exports
export PATH=~/bin:$PATH
export TERM='rxvt-256color'
export EDITOR='vim'
export GOPATH=$HOME
export JAVA_HOME=/usr/lib/jvm/default

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

# Create ssh key pair
function keygen() {
  ssh-keygen -t ed25519 -N '' -C "$@ $(date +%F)" -f "$@"
}

# Set terminal window title
function title() {
  echo -en "\033]0;$@\a"
}

# Clean stopped containers
function dclean() {
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

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

  export PS1="$CLR_GREEN\u$CLR_WHITE@$CLR_BLUE\h$CLR_WHITE:$CLR_YELLOW\w${branch}\n$CLR_CYAN# $CLR_RESET"
}

PROMPT_COMMAND=set_prompt
