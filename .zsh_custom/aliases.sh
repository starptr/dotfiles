alias c="code -n"
alias ls="ls --color"
alias l="ls -A"
alias la="ls -al"

alias e="exa -a"
alias ea="exa -la"
alias d="lsd -A"
alias da="lsd -al"

alias nvim=lvim

alias svim="vim -u NONE"
if $IS_WSL; then
	alias nve="neovide.exe --wsl --disowned"
else
	alias nve="neovide"
fi

emax() {
	setxkbmap -layout us
	setsid emacs "$@"
}

alias qcpp="g++ main.cpp -ggdb -O0 -std=c++17 -fsanitize=address -fno-omit-frame-pointer -o main.out"
