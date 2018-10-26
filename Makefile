EXCLUDED_FILES := Makefile README.md
DOTFILES := $(filter-out $(EXCLUDED_FILES), $(wildcard *))
MAKEFILE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

OS := $(shell uname)
ifeq ($(OS), Linux)
	LN_FLAGS="svfn"
else ifeq ($(OS), Darwin)
	LN_FLAGS="svfh"
endif

dots: $(DOTFILES)
	git update-index --skip-worktree machine_specific # ignore changes forever

$(DOTFILES): # for each dotfile, symlink it to the home directory
	@ln -$(LN_FLAGS) $(MAKEFILE_PATH)/$@ ~/.$@

vimsetup: vim vimrc
	[ ! -e ~/.vim/bundle/Vundle.vim ] && \ # git clone only if file does not exist
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; \
	vim +PluginInstall +qall

clean: # remove all dotfiles in the home directory
	@rm -v $(addprefix ~/., $(DOTFILES))

.PHONY: dots $(DOTFILES) vimsetup clean

