# TODO: Fix the bug where repeated calls to make dots create circular symlinks inside of vim/

EXCLUDED_FILES := Makefile README.md
DOTFILES := $(filter-out $(EXCLUDED_FILES), $(wildcard *))
MAKEFILE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

dots: $(DOTFILES)
	git update-index --skip-worktree machine_specific # ignore changes forever

$(DOTFILES): # for each dotfile, symlink it to the home directory
	@ln -isv $(MAKEFILE_PATH)/$@ ~/.$@

vimsetup: ~/.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
	vim +PluginInstall +qall

clean: # interactively remove all dotfiles in the home directory
	@rm -i $(addprefix ~/., $(DOTFILES))

.PHONY: dots $(DOTFILES) vimsetup clean
