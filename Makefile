all: $(HOME)/.bashrc $(HOME)/.bash_aliases $(HOME)/.bash_profile $(HOME)/.gitconfig
	@echo "build"

$(HOME)/.bashrc:
	ln -s $(CURDIR)/dotfiles/bash/.bashrc $(HOME)/.

$(HOME)/.bash_aliases:
	ln -s $(CURDIR)/dotfiles/bash/.bash_aliases $(HOME)/.

$(HOME)/.bash_profile:
	ln -s $(CURDIR)/dotfiles/bash/.bash_profile $(HOME)/.

$(HOME)/.bash_logout:
	ln -s $(CURDIR)/dotfiles/bash/.bash_logout $(HOME)/.

$(HOME)/.gitconfig:
	ln -s $(CURDIR)/dotfiles/.gitconfig $(HOME)/.

clean:
	rm -rf $(HOME)/.bash_aliases
	rm -rf $(HOME)/.bash_logout
	rm -rf $(HOME)/.bash_profile
	rm -rf $(HOME)/.bashrc
	rm -rf $(HOME)/.gitconfig