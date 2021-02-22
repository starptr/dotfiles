.PHONY: init

init: firstrun submods node rust go java ruby vim-plug finish

firstrun:
	@(! test -s ${HOME}/.bootstrapped) || { echo "You are already bootstrapped! Exiting..."; exit 1; }
	@touch ${HOME}/.bootstrapped
	@echo "This file tells Makefile that this home is already bootstrapped. Only delete if you know what you're doing!" > $$HOME/.bootstrapped
	@echo "First time bootstrapping!"
	@echo

submods:
	@echo "Cloning submodules..."
	yadm submodule update --recursive --init
	@echo "Submodules cloned."
	@echo

submods-update:
	@echo "Updating submodules..."
	yadm submodule update --recursive --remote
	@echo "Submodules update."
	@echo

node:
	@echo "Installing n-install and NodeJS LTS..."
	curl -L https://git.io/n-install | N_PREFIX=${HOME}/.n bash -s -- -n -y lts
	@echo "n-install and NodeJS LTS installed."
	@echo

rust:
	@echo "Installing rust..."
	curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
	@echo "Rust installed."
	@echo

go:
	@echo "Installing g-install..."
	curl -sSL https://git.io/g-install | GOPATH=${HOME}/bin/go GOROOT=${HOME}/.go sh -s -- -y
	@echo "g-install finished."
	@echo

java:
	@echo "Installing jabba..."
	curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh
	@echo "jabba installed."
	@echo

ruby:
	@echo "Installing ruby-build plugin..."
	mkdir -p "$$(${HOME}/.rbenv/bin/rbenv root)"/plugins
	git clone https://github.com/rbenv/ruby-build.git "$$(${HOME}/.rbenv/bin/rbenv root)"/plugins/ruby-build
	@echo "ruby-build installed."
	@echo

vim-plug:
	@echo "Installing vim-plug..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	sh -c 'curl -fLo "${HOME}".local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	@echo "vim-plug installed."
	@echo

finish:
	@echo "Bootstrap complete."
	@echo
