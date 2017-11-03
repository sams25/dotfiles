# TODO: figure out what everything in this file does properly,
# and play around with more
# a really nice example: http://tldp.org/LDP/abs/html/sample-bashrc.html
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for more examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History stuff
# -------------
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash
HISTSIZE=1000 # max lines to remember in command history
HISTFILESIZE=2000 # max lines to store in history file
# ------------

# Misc stuff
# -------------

# command not found, look in the official repositories and suggest something
source /usr/share/doc/pkgfile/command-not-found.bash

# prevent C-s and C-q from suspending and unsuspending the screen
stty -ixon
stty -ixoff

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and recursively into directories (note the TWO *s)
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# a function to set the title of the terminal
function set-title() {
	if [[ -z "$ORIG" ]]; then
		ORIG=$PS1
	fi
	TITLE="\[\e]2;$*\a\]"
	PS1=${ORIG}${TITLE}
}
# -----------

# the prompt is '<username> <pwd>$'
export PS1="\u \w$ "
# Colour stuff
# ------------

# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# To use in a string go "${Col} string-in-colour ${NC} no-colour"

# Normal Colors
Black='\e[0;30m'
Red='\e[0;31m'
Green='\e[0;32m'
Yellow='\e[0;33m'
Blue='\e[0;34m'
Purple='\e[0;35m'
Cyan='\e[0;36m'
White='\e[0;37m'

# Bold
BBlack='\e[1;30m'
BRed='\e[1;31m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
BCyan='\e[1;36m'
BWhite='\e[1;37m'

# Background
On_Black='\e[40m'
On_Red='\e[41m'
On_Green='\e[42m'
On_Yellow='\e[43m'
On_Blue='\e[44m'
On_Purple='\e[45m'
On_Cyan='\e[46m'
On_White='\e[47m'

NC="\e[m" # Color Reset

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# colourise output of less
export LESS_TERMCAP_mb=$'\e[01;31m' \
export LESS_TERMCAP_md=$'\e[01;31m' \
export LESS_TERMCAP_me=$'\e[0m' \
export LESS_TERMCAP_se=$'\e[0m' \
export LESS_TERMCAP_so=$'\e[01;44;33m' \
export LESS_TERMCAP_ue=$'\e[0m' \
export LESS_TERMCAP_us=$'\e[01;32m' \
# ------------

# Useful aliases
# -------------
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias diff='colordiff'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Make ls not show single quotes around files/directories with spaces in them
export QUOTING_STYLE=literal
alias ls='ls -h --color=auto -F'
alias lr='ls -R'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# -------------

# Completion stuff
complete -c man which systemctl
complete -cf sudo
# ---------------------------------------------
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
   elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# ---------------------------------------------

# My local paths
# -------------
# enable makenotes to work from everywhere
alias makenotes='bash ~/MyNotes/makenotes.sh'
alias vless='/usr/share/vim/vim80/macros/less.sh'
# and Sage
# alias sage='~/Documents/Sage/SageMath/sage'
# and Go
# export PATH=$PATH:/usr/local/go/bin
# export GOPATH=$HOME/Documents/Go
# -------------

# For gnome terminals to open in the same directory for new tabs
. /etc/profile.d/vte.sh
