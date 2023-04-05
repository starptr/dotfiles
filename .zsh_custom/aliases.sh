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

alias ra="ranger"
alias f="nnn"

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

# generate list of words between parenthesis
ttgen() {
  rg '"([^"]+)"' "$@" -or '$1'
}

# Use homebrew llvm@11
use-llvm@11() {
  export PATH="/opt/homebrew/opt/llvm@11/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/llvm@11/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm@11/include"
  export LLVM_CONFIG_PATH="/opt/homebrew/opt/llvm@11/bin/llvm-config"
}

# Use homebrew llvm@15
use-llvm@15() {
  export PATH="/opt/homebrew/opt/llvm@15/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/llvm@15/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm@15/include"
  export LLVM_CONFIG_PATH="/opt/homebrew/opt/llvm@15/bin/llvm-config"
}

prioritize-bins() {
  export PATH="$HOME/bin:$PATH"
}
