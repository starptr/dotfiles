read -p "Install brew and dependencies? [y/N] "
if [[ $REPLY =~ ^[Yy]$ ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  /usr/local/bin/brew install git git-lfs subversion cmake ninja libtool automake pkg-config gettext curl xz htop neovim
  /usr/local/bin/brew tap homebrew/cask-fonts
  /usr/local/bin/brew install tmux tealdeer ranger nnn
fi
