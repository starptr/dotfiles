.PHONY: readme run-macos run-linux test-shell

LANG_TOOLS_DIR ?= ${HOME}/.lang-tools

readme:
	@echo "This Makefile should be ran on bootstrap in all cases."
	@echo "If the makefile fails at any step, manually install every step after fixing the failure (i.e. manually installing the tool)."

run-linux: firstrun submods python-linux node-linux rust-linux go-linux java-linux ruby-linux tinytex-linux
run-macos: firstrun submods python-macos node-macos rust-macos go-macos java-macos ruby-linux tinytex-macos

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

python-linux python-macos:
	@echo "Installing: pyenv"
	curl https://pyenv.run | PYENV_ROOT="${LANG_TOOLS_DIR}/.pyenv" bash
	@echo

node-linux node-macos:
	@echo "Installing: node (LTS) and yarn"
	{ curl -L https://git.io/n-install | N_PREFIX=${LANG_TOOLS_DIR}/.n bash -s -- -n -y lts; } || { mkdir ~/src; git clone https://github.com/tj/n.git ${HOME}/src/n; cd ${HOME}/src/n; PREFIX=${LANG_TOOLS_DIR}/.n make install; (n lts); }
	corepack enable
	${LANG_TOOLS_DIR}/.n/bin/npm install -g eslint eslint_d
	@echo

rust-linux rust-macos:
	@echo "Installing: rust"
	curl https://sh.rustup.rs -sSf | CARGO_HOME=${LANG_TOOLS_DIR}/.cargo RUSTUP_HOME=${LANG_TOOLS_DIR}/.rustup sh -s -- -y --no-modify-path
	@echo

go-linux go-macos:
	@echo "Installing: go"
	curl -sSL https://git.io/g-install | GOPATH=${LANG_TOOLS_DIR}/.go-bins GOROOT=${LANG_TOOLS_DIR}/.go sh -s -- -y
	@echo

java-linux java-macos:
	@echo "Installing: java"
	curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | JABBA_HOME=${LANG_TOOLS_DIR}/.jabba bash -s -- --skip-rc && . ${LANG_TOOLS_DIR}/.jabba/jabba.sh
	@echo

ruby-linux ruby-macos:
	@echo "Installing: ruby"
	curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | RBENV_ROOT=${LANG_TOOLS_DIR}/.rbenv bash
	@echo

tinytex-linux tinytex-macos: export TINYTEX_DIR = "${LANG_TOOLS_DIR}"
tinytex-linux tinytex-macos:
	@echo "Installing: tinytex"
	curl -sL "https://yihui.org/tinytex/install-bin-unix.sh" | TINYTEX_DIR=${TINYTEX_DIR} sh

test-shell: # TODO: call a bunch of binaries that shell and bootstrapper should have installed
	bat --version
