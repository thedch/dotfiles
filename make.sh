#!/bin/bash
############################
# make.sh
# This script creates symlinks from the home directory to any desired dotfiles
############################

# This function holds a "blacklist" of files that should not be symlinked
should_ignore () {
    ignore="make.sh README.md"
    for word in $ignore; do
        if [ "$1" == "$word" ]; then
            return 1 # ignore this file!
        fi
    done
    return 0 # don't ignore this file
}

dir=$(pwd) # dotfiles directory
olddir="$dir/.old" # old dotfiles backup directory

# create backup directory
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p "$olddir"
echo "...done"

# iterate through all files in the currect directory, symlinking to ~ as appropriate
for file in *; do
    should_ignore "$file"
    if [ $? -eq 0 ]; then
	echo Linking "$file"...
        mv ~/."$file" "$olddir"
        ln -s "$dir"/"$file" ~/."$file"
    fi
done
