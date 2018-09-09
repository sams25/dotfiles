#!/bin/bash

# A program to check differences for the relevant files

#TODO: Also write a script to copy files over, or set up symlinks accordingly
# Is this script even necessary? Doesn't copying and git-diff do the same thing?

# the files in our git repository, but are stored in the home directory
FILES="
.bash_aliases
.bashrc
.get_battery.sh
.gitconfig
.inputrc
.makenotes.sh
.profile
.Rprofile
.tmux.conf
.vimrc
.vim/skeleton.*
"

for f in $FILES
do
    echo "------ Checking $f ------"
    diff --color=always $f ~/$f
done
