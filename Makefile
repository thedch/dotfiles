EXCLUDED_DOTFILES := Makefile make.sh setup_vim.sh README.md
DOTFILES := $(filter-out $(EXCLUDED_DOTFILES), $(wildcard *))
MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))

dots: $(DOTFILES)
	git update-index --skip-worktree machine_specific # ignore changes forever

clean: # interactively remove all dotfiles in the home directory
	rm -i $(addprefix ~/., $(DOTFILES))

vimsetup: ~/.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
	vim +PluginInstall +qall

$(DOTFILES): # for each dotfile, symlink it to the home directory
	@echo ln -sv $(MAKEFILE_PATH)/$@ ~/.$@

.PHONY: dots clean $(DOTFILES)
