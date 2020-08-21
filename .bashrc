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
HISTSIZE=100000     # max number of commands to remember
HISTFILESIZE=100000 # max number of lines in history file
# Write to history file after every run so that we don't need clean log-outs
# from all sessions in order to save history
export PROMPT_COMMAND='history -a'
# ------------

# Misc stuff
# -------------

# prevent C-s and C-q from suspending and un-suspending the screen
stty -ixon
stty -ixoff

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and recursively into directories (note the TWO *s)
shopt -s globstar

# Colour stuff
# ------------

# Colour definitions (taken from Colour Bash Prompt HowTo).
# To use in a string go "${Col} string-in-colour ${NC} no-colour"

# Normal Colours
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

NC="\e[m" # Colour Reset

# For prompts specifically
tput_bold=$(tput bold)
tput_reset=$(tput sgr0)

# \u for username
# \w for full pwd, \W for final part of pwd
# \$ $ if normal user, # if sudo
# the max number of dirs to print (rest is ...)
PROMPT_DIRTRIM=3

export PS1="\[$tput_reset\]\[$Green\]\w\[$tput_reset\] "

# set a fancy prompt (non-colour, unless we know we "want" colour)
# TODO: make this work
case "$TERM" in
    xterm-colour) colour_prompt=yes;;
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

# Completion stuff
complete -c man which systemctl
complete -cf sudo fusermount

PATH=$PATH:~/.scripts/
# Paths
export GEM_HOME=$HOME/.gem
PATH="$PATH:${GEM_HOME}/bin"

# Adding Haskell Stack to path
PATH=$PATH:~/.local/bin
# Adding Cabal binaries to path
PATH=$PATH:~/.cabal/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/anindya/google-cloud-sdk/path.bash.inc' ]; then . '/home/anindya/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/anindya/google-cloud-sdk/completion.bash.inc' ]; then . '/home/anindya/google-cloud-sdk/completion.bash.inc'; fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
