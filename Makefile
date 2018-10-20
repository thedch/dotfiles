SHELL:=/bin/bash
EXCLUDED_DOTFILES := Makefile make.sh setup_vim.sh README.md
DOTFILES := $(filter-out $(EXCLUDED_DOTFILES), $(wildcard *))

dots: $(DOTFILES)

clean: # interactively remove all dotfiles in the home directory
	rm -i $(addprefix ~/., $(DOTFILES))

vimsetup: ~/.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
	vim +PluginInstall +qall

$(DOTFILES): # for each dotfile, symlink it to the home directory
	@echo ln -sv $@ ~/.$@

.PHONY: dots clean $(DOTFILES)
