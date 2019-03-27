# explicitly expand aliases, needed so that Vim can use this file
shopt -s expand_aliases

# Programs (basic utilites)
alias diff='colordiff'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias top='top -o %CPU'
alias ctags='ctags --options=$HOME/.ctags'

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

# Power management
# Optional: Add these commands to sudoers using visudo, and make them not
# require a password
alias reboot="sudo systemctl reboot"
alias poweroff="sudo systemctl poweroff"
alias shutdown="sudo systemctl shutdown"
alias halt="sudo systemctl halt"

# Other programs
alias vimro='vim -R'
alias R="R --quiet --no-save"
alias youtube-dl-music="youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 0"

# My local paths
# -------------

PATH="$PATH:$HOME/aur_packages/android-studio/bin/"

PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/anindya/google-cloud-sdk/path.bash.inc' ]; then . '/home/anindya/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/anindya/google-cloud-sdk/completion.bash.inc' ]; then . '/home/anindya/google-cloud-sdk/completion.bash.inc'; fi
