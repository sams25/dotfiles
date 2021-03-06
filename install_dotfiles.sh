#!/bin/bash

# A program to deploy the dotfiles in this repository to the home directory
# CHANGE THIS AS REQUIRED:
DOTFILE_DIR="`pwd`"

DIRS="
.config/dunst
.config/feh
.config/htop
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
.config/feh/*
.config/htop/*
.config/i3/*
.config/i3status/*
.ctags
.duckduckgosettings
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

echo -e "Using dotfile directory $DOTFILE_DIR\n"

for dir in $DIRS
do
    # TODO: figure out a better way of dealing with folders
    # First make the directories if they don't exist
    mkdir -pv $HOME/$dir
done

for file in $FILES
do
    # Then create symbolic links
    # Only output the newly created links
    ln -sv $DOTFILE_DIR/$file $HOME/$file 2>/dev/null
done
echo "Done"
