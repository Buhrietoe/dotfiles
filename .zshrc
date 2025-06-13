#-----------------------------
# Source some stuff
#-----------------------------
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#------------------------------
# History stuff
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#-----------------------------
# Dircolors
#-----------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#------------------------------
# Keybindings
#------------------------------
bindkey -v
bindkey '^R' history-incremental-search-backward
typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

#------------------------------
# Alias stuff
#------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls --color=auto'
alias l='ls -AFhl'
alias ll='ls -AFhl | less'
alias t='journalctl -n 20'
alias n='nvim'
alias purgeswap='sudo swapoff -a && sudo swapon -a'
alias webcam='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 30'
alias screenoff='sleep 1 && xset dpms force off'
alias nobs='sed "/^ *$/d;/^ *#/d"'
alias k="kubectl"

# package manager aliases
alias pu='nice yay'
alias yup='sudo nice yum upgrade'
alias gup='sudo nice emerge --update --deep --with-bdeps=y --newuse --ask world'
alias aup='sudo nice apt-get update && sudo nice apt-get dist-upgrade'
alias vup='nice vim +PlugClean +q +PlugUpgrade +PlugUpdate +q +q'
alias py='source ~/py/bin/activate && echo Python environment activated'
alias updatemirrors='sudo reflector -c "United States" -f 5 -p "http" --verbose --save /etc/pacman.d/mirrorlist'
alias pipup='pip freeze --local --all | grep -v "^\-e" | cut -d = -f 1 | xargs pip install --upgrade'
alias gb='go build -v -ldflags "-w -s" .'
alias gbs='CGO_ENABLED=0 go build -v -ldflags "-extldflags \"-static\" -w -s" .'

# nerdctl aliases
alias dr='nerdctl run -it --rm'
alias di='nerdctl images'
alias dp='nerdctl ps -a'

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# kubernetes namespace
kn() {
    kubectl config set-context --current --namespace=$1
}

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
    nerdctl rm -v $(nerdctl ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    nerdctl rmi $(nerdctl images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# Checkout files from a specific commit without a merge
function gicof() {
    if [ -z "$1" ]; then
        echo Specify branch/commit
        exit 1
    else
        for i in $(git diff-tree --name-only --pretty="" -r $1); do
            git show $1:$i >$i
        done
    fi
}

# Pretty git logs
function gitlog() {
    git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all
}

# Manage ssh agent with keychain
if [ -x "$(command -v keychain)" ]; then
    for file in ~/.ssh/*; do
        if [[ $(head -n 1 "$file" 2>/dev/null) == "-----BEGIN"*"PRIVATE KEY-----" ]]; then
            eval $(keychain -q --eval $file)
        fi
    done
fi

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

#- buggy
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#-/buggy

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#------------------------------
# Window title
#------------------------------
case $TERM in
  alacritty|termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
      vcs_info
      print -Pn "\e]0;[%n@%M][%~]%#\a"
    } 
    preexec () { print -Pn "\e]0;[%n@%M][%~]%# ($1)\a" }
    ;;
  tmux|screen|screen-256color)
    precmd () { 
      vcs_info
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a" 
    }
    preexec () { 
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a" 
    }
    ;; 
esac

#------------------------------
# Prompt
#------------------------------
autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{${fg[white]}%}[%{${fg[green]}%}%s%{${fg[white]}%}][%{${fg[magenta]}%}%r/%S%%{${fg[white]}%}][%{${fg[cyan]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[white]}%}]%{$reset_color%}"

setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    p_host='%F{yellow}%M%f'
  else
    p_host='%F{green}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{white}[%f
    %(!.%F{red}%n%f.%F{green}%n%f)
    %F{white}@%f
    ${p_host}
    %F{white}][%f
    %F{magenta}%~%f
    %F{white}]"\n"%f
    %(!.%F{red}#%f.%F{magenta}#%f)
    " "
  '}}

  PS2=$'%_>'
  RPROMPT=$'${vcs_info_msg_0_}'
}
setprompt

# local system specific config
[ -f ~/.zsh_local ] && . ~/.zsh_local

# vim: set ts=2 sw=2 et:
