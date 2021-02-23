.PHONY: init

init: firstrun submods python node rust go java ruby vim-plug finish
remove: firstrun-check submods-remove python-remove node-remove rust-remove go-remove java-remove ruby-remove lastrun

firstrun:
	@(! test -s ${HOME}/.bootstrapped) || { echo "You are already bootstrapped! Exiting..."; exit 1; }
	@touch ${HOME}/.bootstrapped
	@echo "This file tells Makefile that this home is already bootstrapped. Only delete if you know what you're doing!" > $$HOME/.bootstrapped
	@echo "First time bootstrapping!"
	@echo

firstrun-check:
	@(test -s ${HOME}/.bootstrapped) || { echo "You haven't bootstrapped! Exiting..."; exit 1; }
	@(test -s ${HOME}/.bootstrap-remove) || { echo "The file .bootstrap-remove isnt in the home directory. touch this file and enter data to continue with removal. Exiting..."; exit 1; }
	@rm -f ${HOME}/.bootstrap-remove
	@echo "You have bootstrapped. Continuing removal..."
	@echo

lastrun:
	@echo "Resetting bootstrapped state to new..."
	rm -f ${HOME}/.bootstrapped
	@echo "Bootstrap state clean!"
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

submods-remove:
	@echo "Warning! All local submodule changes will be lost."
	yadm submodule foreach --recursive git reset --hard
	@echo "Submodule heads are reset."
	@echo

python:
	@echo "Installing pyenv..."
	curl https://pyenv.run | bash
	@echo "pyenv installed."
	@echo

python-remove:
	@echo "Warning! pyenv and local python installs will be removed."
	rm -rf ${HOME}/.pyenv
	@echo "pyenv and python removed."
	@echo

node:
	@echo "Installing n-install and NodeJS LTS..."
	curl -L https://git.io/n-install | N_PREFIX=${HOME}/.n bash -s -- -n -y lts
	@echo "n-install and NodeJS LTS installed."
	@echo

node-remove:
	@echo "Warning! n-install will be removed."
	n-uninstall -y
	@echo "n-install and NodeJS installs removed."
	@echo

rust:
	@echo "Installing rust..."
	curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
	@echo "Rust installed."
	@echo

rust-remove:
	@echo "Warning! rust will be removed."
	rustup self uninstall
	@echo "Rust removed."
	@echo

go:
	@echo "Installing g-install..."
	curl -sSL https://git.io/g-install | GOPATH=${HOME}/bin/go GOROOT=${HOME}/.go sh -s -- -y
	@echo "g-install finished."
	@echo

go-remove:
	@echo "Warning! go and g will be removed, including files in $$GOROOT."
	rm -rf ${GOPATH} ${GOROOT}
	@echo "g removed."
	@echo

java:
	@echo "Installing jabba..."
	curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh
	@echo "jabba installed."
	@echo

java-remove:
	@echo "Warning! jabba and java will be removed."
	rm -rf ${JABBA_HOME}
	@echo "jabba removed."
	@echo

ruby:
	@echo "Installing ruby-build plugin..."
	curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
	@echo "ruby-build installed."
	@echo

ruby-remove:
	@echo "Warning! rbenv will be removed."
	rm -rf `rbenv root`
	@echo "rbenv removed."
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
