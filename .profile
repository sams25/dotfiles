#!bin/bash
# Profile - runs on login

export EDITOR="vim"
export BROWSER="firefox"
export TERMINAL="tilix"
export READER="zathura"

export PATH=$PATH:$HOME/.scripts

# Uncomment if you want to start X on login

#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi
