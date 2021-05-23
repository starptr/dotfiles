alias c="code -n"
alias ls="ls --color"
alias l="ls -A"
alias la="ls -al"

alias svim="vim -u NONE"
if $IS_WSL; then
	alias nv="neovide.exe --wsl"
else
	alias nv="neovide"
fi

alias e="exa -a"
alias ea="exa -la"
