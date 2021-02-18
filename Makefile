.PHONY: all

all: submods # node rust go java ruby

submods:
	@echo "Cloning submodules..."
	yadm submodule update --recursive --init
	@echo "Submodules cloned."
	@echo

node:
	@echo "Installing n-install and NodeJS LTS..."
	N_PREFIX="$HOME/.n"
	curl -L https://git.io/n-install | bash -s -- -n -y lts
	@echo "n-install and NodeJS LTS installed."
	@echo

rust:
	@echo "Installing rust..."
	curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
	@echo "Rust installed."
	@echo

go:
	@echo "Installing g-install..."
	GOPATH="$HOME/bin/go"
	GOROOT="$HOME/.go"
	curl -sSL https://git.io/g-install | sh -s -- -y
	@echo "g-install finished."
	@echo

java:
	@echo "Installing jabba..."
	curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh
	@echo "jabba installed."
	@echo

ruby:
	@echo "Installing ruby-build plugin..."
	mkdir -p "$(rbenv root)"/plugins
	git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
	@echo "ruby-build installed."
	@echo
