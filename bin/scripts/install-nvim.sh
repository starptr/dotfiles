mkdir -p "$HOME/bin/appimages"
curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o "$HOME/bin/appimages/nvim.appimage"
ln -s "$HOME/bin/appimages/nvim.appimage" "$HOME/bin/nvim"
