#!/bin/bash

# A program to deploy the dotfiles in this repository to the home directory
# CHANGE THIS AS REQUIRED:
DOTFILE_DIR="`pwd`"

DIRS="
.config/dunst
.config/i3
.config/i3status
.scripts/
.vim/
"

FILES="
.bash_aliases
.bash_profile
.bashrc
.config/dunst/*
.config/i3/*
.config/i3status/*
.ctags
.gitconfig
.inputrc
.profile
.Rprofile
.scripts/*
.tmux.conf
.vim/skeleton.*
.vimrc
.xbindkeysrc
.xinitrc
"

echo "Using dotfile directory $DOTFILE_DIR"

# First make the directories if they don't exist
# TODO: figure out a better way of dealing with folders
for dir in $DIRS
do
    echo "Making directory $dir at $HOME"
    mkdir -p $HOME/$dir
done

# Then create symbol links
for file in $FILES
do
    echo "Creating symlink to $file at $HOME"
    ln -sf $DOTFILE_DIR/$file $HOME/$file
done
