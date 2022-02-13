alias c="code -n"
alias ls="ls --color"
alias l="ls -A"
alias la="ls -al"

alias e="exa -a"
alias ea="exa -la"

d() {
  if [ "$PWD" = ~/Downloads ]; then
    lsd -A --sort time "$@"
  else
    lsd -A "$@"
  fi
}

da() {
  if [ "$PWD" = ~/Downloads ]; then
    lsd -Alr --sort time "$@"
  else
    lsd -Al "$@"
  fi
}

alias f="ranger"

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
