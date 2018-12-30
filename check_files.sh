#!/bin/bash

# A program to check differences for the relevant files

#TODO: Also write a script to copy files over, or set up symlinks accordingly
# Is this script even necessary? Doesn't copying and git-diff do the same thing?

# the files in our git repository, but are stored in the home directory
FILES="
.config/i3/*
.bash_aliases
.bash_profile
.bashrc
.ctags
.scripts/*
.gitconfig
.inputrc
.profile
.Rprofile
.tmux.conf
.vimrc
.vim/skeleton.*
.xbindkeysrc
.xinitrc
"
# TODO: add ranger config files

for f in $FILES
do
    echo "------ Checking $f ------"
    diff --color=always $f $HOME/$f
done
