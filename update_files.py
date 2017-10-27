# a program to update the relevant files
import subprocess

# the files in our git repository, but are stored in the home directory
files = [".gitconfig", ".inputrc", ".bashrc", ".vimrc", ".zshrc", ".gvimrc",
        ".profile", ".tmux.conf"]

for filename in files:
    subprocess.call("cp ~/" + filename + " .", shell=True)
