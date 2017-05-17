# a program to update the relevant files
import subprocess

# the files in our git repository, but are stored in the home directory
files = [".inputrc", ".bashrc", ".vimrc", ".zshrc"]

for filename in files:
    subprocess.call("cp ~/" + filename + " .", shell=True)


