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
alias purgeswap='sudo swapoff -a && sudo swapon -a'
alias webcam='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 30'
alias screenoff='sleep 1 && xset dpms force off'
alias nobs='sed "/^ *$/d;/^ *#/d"'

# package manager aliases
alias pu='nice yay'
alias yup='sudo nice yum upgrade'
alias gup='sudo nice emerge --update --deep --with-bdeps=y --newuse --ask world'
alias aup='sudo nice apt-get update && sudo apt-get dist-upgrade'

# docker aliases
alias dvi='dockviz images --tree -i'
alias dr='docker run -it --rm'
alias di='docker images'
alias dp='docker ps -a'
alias ds='docker stack'

# other updates
alias vup='vim +PluginClean +q +PluginUpdate +q +GoUpdateBinaries +q'
alias py='source ~/py/bin/activate && echo Python environment activated'
alias updatemirrors='sudo reflector -c "United States" -f 5 -p "http" --verbose --save /etc/pacman.d/mirrorlist'
alias pipup='pip freeze --local --all | grep -v "^\-e" | cut -d = -f 1 | xargs pip install --upgrade'
alias gb='go build -v -ldflags "-w -s" .'
alias gbs='CGO_ENABLED=0 go build -v -ldflags "-extldflags \"-static\" -w -s" .'

# exports
export PATH=~/bin:$PATH
export EDITOR='vim'

# Prompt colors
CLR_RESET='\[\e[0m\]'
# Normal colors
CLR_BLACK='\[\e[0;30m\]'
CLR_RED='\[\e[0;31m\]'
CLR_GREEN='\[\e[0;32m\]'
CLR_YELLOW='\[\e[0;33m\]'
CLR_BLUE='\[\e[0;34m\]'
CLR_PURPLE='\[\e[0;35m\]'
CLR_CYAN='\[\e[0;36m\]'
CLR_WHITE='\[\e[0;37m\]'
# Bold colors
CLR_BBLACK='\[\e[1;30m\]'
CLR_BRED='\[\e[1;31m\]'
CLR_BGREEN='\[\e[1;32m\]'
CLR_BYELLOW='\[\e[1;33m\]'
CLR_BBLUE='\[\e[1;34m\]'
CLR_BPURPLE='\[\e[1;35m\]'
CLR_BCYAN='\[\e[1;36m\]'
CLR_BWHITE='\[\e[1;37m\]'

# Create ssh key pair
function keygen() {
  ssh-keygen -t rsa -b 4096 -N '' -C "$@ $(date +%F)" -f "$@"
}

# Set terminal window title
function title() {
  echo -en "\033]0;$@\a"
}

# Remove pacman orphans
function pro() {
    pacman -Qtdq | sudo pacman -Rns -
}

# Clean stopped containers
function dclean() {
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# Checkout files from a specific commit without a merge
function gicof() {
    if [ -z "$1" ]; then
        echo Specify branch/commit
        exit 1
    else
        for i in $(git diff-tree --name-only --pretty="" -r $1); do
            git show $1:$i > $i
        done
    fi
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

  export PS1="$CLR_GREEN\u$CLR_WHITE@$CLR_GREEN\h$CLR_BWHITE:$CLR_RESET\w${branch}\n$CLR_WHITE# $CLR_RESET"
}

PROMPT_COMMAND=set_prompt

# set console colors same as Xresources
if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
fi

# local system specific config
[ -f ~/.bash_local ] && . ~/.bash_local
