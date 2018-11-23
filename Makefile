SHELL := /bin/bash
EXCLUDED_FILES := Makefile README.md
DOTFILES := $(filter-out $(EXCLUDED_FILES), $(wildcard *))
MAKEFILE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

dots: $(DOTFILES)
	git update-index --skip-worktree machine_specific # ignore changes forever

$(DOTFILES): # for each dotfile, symlink it to the home directory
	@ln -svfn $(MAKEFILE_PATH)/$@ ~/.$@

clean: # remove all dotfiles in the home directory
	@rm -v $(addprefix ~/., $(DOTFILES))

.PHONY: dots $(DOTFILES) clean
