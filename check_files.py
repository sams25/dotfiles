#TODO: Also write a script to copy files over, or set up symlinks accordingly
# Is this script even necessary? Doesn't copying and git-diff do the same thing?

# a program to check differences for the relevant files
import subprocess

# the files in our git repository, but are stored in the home directory
files = [
        ".bash_aliases",
        ".bashrc",
        ".get_battery.sh",
        ".gitconfig",
        ".inputrc",
        ".makenotes.sh",
        ".profile",
        ".Rprofile",
        ".tmux.conf",
        ".vimrc",
        ]

for filename in files:
    print("------ Checking " + filename + " ------")
    subprocess.call("diff --color=always " + filename + " ~/" + filename, shell=True)
