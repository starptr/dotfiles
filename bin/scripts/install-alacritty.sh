sudo apt update
sudo apt -y install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev
mkdir -p "$HOME/src"
git clone https://github.com/alacritty/alacritty.git "$HOME/src/alacritty"
cd "$HOME/src/alacritty"
cargo build --release
ln -s "$HOME/bin/alacritty" "target/release/alacritty"
