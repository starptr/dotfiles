#!/bin/sh

echo "Changing shell to zsh..."
chsh -s /bin/zsh

read -p "Install dependencies? [y] "
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	sudo apt update
	sudo apt -y install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
fi

# Make
cd "$HOME"
echo "Begin make"
make all
