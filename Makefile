.PHONY: readme run-macos run-linux test-shell

readme:
	@echo "This Makefile should be ran on bootstrap in all cases."
	@echo "If the makefile fails at any step, manually install every step after fixing the failure (i.e. manually installing the tool)."

run-linux: firstrun submods python-linux node-linux rust-linux go-linux java-linux ruby-linux tinytex-linux
run-macos: firstrun submods node-macos rust-macos go-macos java-macos tinytex-macos

# Writes a file that tells the Makefile that bootstrap was ran.
# Prevents accidentally running the `run-*` targets multiple times.
firstrun: 
	@(! test -s ${HOME}/.bootstrapped) || { echo "You are already bootstrapped! \nTo really run a `run-*` target again, remove `~.bootstrapped`."; exit 1; }
	touch ${HOME}/.bootstrapped
	@echo "This file tells Makefile that this home is already bootstrapped. Only delete if you know what you're doing!" > $$HOME/.bootstrapped
	@echo "First time bootstrapping!"
	@echo

# Clone submodules recursively
submods: 
	@echo "Cloning submodules..."
	yadm submodule update --recursive --init
	@echo "Submodules cloned."
	@echo

python-linux:
	@echo "Installing: pyenv"
	curl https://pyenv.run | bash
	@echo

node-linux node-macos:
	@echo "Installing: node (LTS) and yarn"
	{ curl -L https://git.io/n-install | N_PREFIX=${HOME}/.n bash -s -- -n -y lts; } || { mkdir ~/src; git clone https://github.com/tj/n.git ${HOME}/src/n; cd ${HOME}/src/n; PREFIX=${HOME}/.n make install; (n lts); }
	npm i --global yarn
	@echo

rust-linux rust-macos:
	@echo "Installing: rust"
	curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
	@echo

go-linux go-macos:
	@echo "Installing: go"
	curl -sSL https://git.io/g-install | GOPATH=${HOME}/bin/go GOROOT=${HOME}/.go sh -s -- -y
	@echo

java-linux java-macos:
	@echo "Installing: java"
	curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh
	@echo

ruby-linux:
	@echo "Installing: ruby"
	curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash
	@echo

tinytex-linux tinytex-macos:
	@echo "Installing: tinytex"
	curl -sL "https://yihui.org/tinytex/install-bin-unix.sh" | sh

test-shell: # TODO: call a bunch of binaries that shell and bootstrapper should have installed
	bat --version
