EXCLUDED_DOTFILES := Makefile make.sh setup_vim.sh README.md
DOTFILES := $(filter-out $(EXCLUDED_DOTFILES), $(wildcard *))
MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))

dots: $(DOTFILES)
	git update-index --skip-worktree machine_specific # ignore changes forever

$(DOTFILES): # for each dotfile, symlink it to the home directory
	@echo ln -sv $(MAKEFILE_PATH)/$@ ~/.$@

vimsetup: ~/.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
	vim +PluginInstall +qall

clean: # interactively remove all dotfiles in the home directory
	rm -i $(addprefix ~/., $(DOTFILES))

.PHONY: dots clean $(DOTFILES)
