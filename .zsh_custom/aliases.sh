alias c="code -n"
alias ls="ls --color"
alias l="ls -A"
alias la="ls -al"

alias e="exa -a"
alias ea="exa -la"
alias d="lsd -A"
alias da="exa -al"

alias svim="vim -u NONE"
if $IS_WSL; then
	alias nve="neovide.exe --wsl"
else
	alias nve="neovide"
fi

