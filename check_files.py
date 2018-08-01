# a program to check differences for the relevant files
import subprocess

# the files in our git repository, but are stored in the home directory
files = [
        ".bash_aliases",
        ".bashrc",
        ".gitconfig",
        ".inputrc",
        ".profile",
        ".Rprofile",
        ".tmux.conf",
        ".vimrc",
        ".zshrc",
        ]

for filename in files:
    print("------ Checking " + filename + " ------")
    subprocess.call("diff --color=always ~/" + filename + " " + filename, shell=True)
