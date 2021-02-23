mkdir -p "$HOME/bin/appimages"
curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o "$HOME/bin/appimages/nvim.appimage"
chmod +x "$HOME/bin/appimages/nvim.appimage"
ln -fs "$HOME/bin/appimages/nvim.appimage" "$HOME/bin/nvim"
