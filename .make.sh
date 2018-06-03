#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles
############################

dir=$(pwd) # dotfiles directory
olddir="$dir/.old" # old dotfiles backup directory

# create backup directory
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

for dotfile in *; do
    if [ -d "$dotfile" ]; then 
        continue
    fi 
    echo "Backing up and then linking $dotfile..."
    mv ~/.$dotfile $olddir
    ln -s  $dir/$dotfile ~/.$dotfile
done
