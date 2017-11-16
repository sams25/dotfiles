# a program to check differences for the relevant files
import subprocess

# the files in our git repository, but are stored in the home directory
files = [".gitconfig", ".inputrc", ".bashrc", ".vimrc", ".zshrc", ".gvimrc",
        ".profile", ".tmux.conf"]

for filename in files:
    print("------ Checking " + filename + " ------")
    subprocess.call("diff --color=always ~/" + filename + " " + filename, shell=True)
