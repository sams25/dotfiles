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

# prevent C-s and C-q from suspending and unsuspending the screen
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

# Color definitions (taken from Color Bash Prompt HowTo).
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

# Two-line TODO
# Borrowed from https://jerodsanto.net/2010/12/minimally-awesome-todos/
export TODO=~/.todo
if [ ! -f $TODO ]; then
    touch $TODO
fi

export TODO_categories="** 1: Work   2: Personal   3: Fun   4: Extra **"
function todate()
{
    sort -o $TODO $TODO
}
function todo()
{
    # Add a new task
    # Or, if no arugments, show list of tasks
    if [ "$#" == "0" ]
    then
        if [ -s $TODO ]
        then
            echo -e "${BRed}$TODO_categories${NC}"
            cat $TODO
        else
            echo 'No tasks to do!'
        fi
    else
        echo "- $@" >> $TODO
        todate
    fi
}
function todone()
{
    # Remove a task from the list
    if [ "$#" != "0" ]
    then
        vim -c "%s/^.*$*.*$//c" -c "g/^$/d" -c "wq" $TODO
    else
        echo 'Specify a task you have done!'
    fi
}
function todraft()
{
    # Edit the todo list manually
    vim $TODO
    todate
}
function numtodo()
{
    x=$(wc -l < $TODO)
    echo "[$x]"
}

# For prompts specifically
tput_bold=$(tput bold)
tput_reset=$(tput sgr0)

# \u for username
# \w for full pwd, \W for final part of pwd
# \$ $ if normal user, # if sudo
# the max number of dirs to print (rest is ...)
PROMPT_DIRTRIM=3

export PS1='`numtodo`'"\[$tput_reset\]\[$Green\]\w\[$tput_reset\] "

# set a fancy prompt (non-color, unless we know we "want" color)
# TODO: make this work
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

# Completion stuff
complete -c man which systemctl
complete -cf sudo fusermount

# Paths
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem
