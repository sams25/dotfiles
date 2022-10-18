# explicitly expand aliases, needed so that Vim can use this file
shopt -s expand_aliases

# Programs (basic utilites)
alias diff='colordiff'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias top='top -o %CPU'
alias ctags='ctags --options=$HOME/.ctags'

# Get old vim by typing \vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

# Make ls not show single quotes around files/directories with spaces in them
export QUOTING_STYLE=literal
alias ls='ls -h --color=auto -F'
alias lr='ls -R'
alias ll='ls -alF'
alias lt='ls -alFt'
alias la='ls -A'
alias l='ls -CF'

# don't fuck up
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# basic error correction and laziness
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias sl='ls'

# Other programs
alias vimro='vim -R'
alias R="R --quiet --no-save"
alias youtube-dl-music="yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 0"
# Stupid Ubuntu
alias python='/usr/bin/python3'
alias pip='/usr/bin/pip3'
