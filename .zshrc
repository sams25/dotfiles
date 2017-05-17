# TODO: compare this to bashrc, and figure out what you want carried over
# use these sample zshrc files
# https://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc
# https://github.com/slashbeast/things/blob/master/configs/DOTzshrc
# http://zsh.sourceforge.net/Contrib/startup/std/zshrc
# http://zsh.sourceforge.net/Guide/zshguide02.html
# http://stackoverflow.com/questions/171563/whats-in-your-zshrc
# http://zsh.sourceforge.net/Guide/zshguide.html

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use vi keybindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
set hist_ignore_all_dups # ignores duplicates
set hist_ignore_space # ignores lines beginning with space

# Basic variables
export EDITOR="vim"

# Completion stuff - TODO: figure out what this stuff does
# ------------------------------------------------------------------------
# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

