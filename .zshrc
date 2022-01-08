# Define vars
export ZSH_CUSTOM="$HOME/.zsh_custom"

# doom
export PATH="$HOME/.emacs.d/bin:$PATH"

# n-install
export N_PREFIX="$HOME/.n"; PATH="$N_PREFIX/bin:$PATH"

# yarn
if command -v yarn &> /dev/null; then
	export PATH="$(yarn global bin):$PATH"
fi

# add rust bins to path
export PATH="$HOME/.cargo/bin:$PATH"

# Go version manager and golang paths
export GOPATH="$HOME/bin/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias ggg="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# jabba paths
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

# ruby paths
export PATH="$HOME/.rbenv/bin:$PATH"
if command -v rbenv &> /dev/null; then
	eval "$(rbenv init -)"
fi

# Add texlive to path
export PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"
export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH"


# Custom directory colors # Update: use zinit
if command -v vivid &> /dev/null; then
	export LS_COLORS="$(vivid generate snazzy)"
fi

# fzf shell extension
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node \
    zdharma-continuum/z-a-submods

### End of Zinit's installer chunk

alias zce="zinit ice"

#zinit snippet PZTM::environment
#zinit snippet PZT::modules/terminal
#zinit snippet PZT::modules/editor
#zinit snippet PZT::modules/history
#zinit snippet PZT::modules/directory
#zinit snippet PZT::modules/spectrum
#zinit snippet PZT::modules/utility
#zinit snippet PZT::modules/ssh
#zinit snippet PZT::modules/completion
##zinit snippet PZT::modules/ruby
#zinit ice silent
#zinit snippet PZT::modules/git
##zinit snippet PZT::modules/history-substring-search
##zinit snippet PZTM::syntax-highlighting

# Custom aliases
source $ZSH_CUSTOM/aliases.sh

setopt promptsubst

#PS1="READY >"

zinit ice pick"async.zsh"
zinit light mafredri/zsh-async

#zinit ice svn silent atload'prompt sorin'
#zinit snippet PZT::modules/prompt

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice lucid atinit"zicompinit; zicdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

#function _history_substring_search_config() {
#	# substring search keys
#	bindkey '$terminfo[kcuu1]' history-substring-search-up
#	bindkey '$terminfo[kcud1]' history-substring-search-down
#}
#
#zinit ice wait lucid atload'_history_substring_search_config'
#zinit light zsh-users/zsh-history-substring-search

zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'
zstyle ':prezto:module:python:virtualenv' initialize 'yes'
zinit ice wait lucid
zinit snippet PZT::modules/python

# Neovim
#if [ "$OS_NAME" = "Mac" ]; then
#	zinit ice wait lucid from"gh-r" as"program" bpick"*macos*" mv"*/bin/nvim -> nvim"
#else
#	zinit ice wait lucid from"gh-r" as"program" bpick"*.appimage" mv"*.appimage -> nvim"
#fi
zinit ice wait lucid as"null" atclone'git checkout 76435c0cfa8f39024a3b931276478b5007a1f421; make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim_build"; make install' atpull"rm -rf $HOME/neovim_build; %atclone"
zinit light neovim/neovim

# add neovim bins to path
export PATH="$HOME/neovim_build/bin:$PATH"

# Kitty term
#zinit ice wait lucid from"gh-r" ver"latest" as"program" mv"bin/kitty -> kitty"
#zinit light kovidgoyal/kitty

# lsd
zinit ice wait lucid from"gh-r" as"program" bpick"lsd*" mv"*/lsd -> lsd" mv"*/lsd.exe -> lsd"
zinit light Peltoche/lsd

# exa
zinit ice wait lucid from"gh-r" as"program" bpick"exa-linux-x86_64-*" mv"bin/exa -> exa"
zinit light ogham/exa

# bat
zinit ice wait lucid from"gh-r" as"program" mv"*/bat -> bat"
zinit light sharkdp/bat

# ranger
zinit ice wait lucid ver"stable" as"null" atclone"~/.pyenv/shims/python3 setup.py -- install --user --optimize=1 --record=install_log.txt" atpull"xargs rm < install_log.txt; %atclone"
zinit light ranger/ranger

# ripgrep
zinit ice wait lucid from"gh-r" as"program" mv"ripgrep*/rg -> rg"
zinit light BurntSushi/ripgrep

# fd
zinit ice wait lucid from"gh-r" as"program" mv"fd*/fd -> fd"
zinit light sharkdp/fd

# lazygit
zinit ice wait lucid from"gh-r" as"program"
zinit light jesseduffield/lazygit

# shellcheck
zinit ice wait lucid from"gh-r" as"program" mv"shellcheck-*/shellcheck -> shellcheck"
zinit light koalaman/shellcheck

# Git Credential Manager Core
#zinit ice wait lucid from"gh-r" as"program" mv"gcmcore-linux*/git-credential-manager-core -> git-credential-manager-core"
#zinit light microsoft/Git-Credential-Manager-Core

# wezterm
#zinit ice wait lucid from"gh-r" as"program" bpick"wezterm-*Ubuntu20.04.tar.xz" mv"wezterm/usr/bin/wezterm-mux-server -> wezterm-mux-server"
#zinit ice wait lucid from"gh-r" as"program" bpick"wezterm-*Ubuntu20.04.tar.xz" mv"wezterm/usr/bin/wezterm -> wezterm"
#zinit light wez/wezterm

# clangd
zinit ice wait lucid from"gh-r" as"program" mv"clangd*/bin/clangd -> clangd"
zinit light clangd/clangd

# yadm completions
zinit ice wait lucid atload"zicompinit; zicdreplay" blockf pick"completion/zsh/_yadm" as"program"
zinit light TheLocehiliosan/yadm

# direnv
zinit ice lucid from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh"
zinit light direnv/direnv

# added by travis gem
[ ! -s /home/yuto/.travis/travis.sh ] || source /home/yuto/.travis/travis.sh

# Wezterm SSH
CURR_PROCESS_LIST=$(ps aux)
if [[ "$(grep "[s]shd: [^\/]" <<< "$CURR_PROCESS_LIST")" && "$(grep "[w]ezterm cli proxy" <<< "$CURR_PROCESS_LIST")" ]]; then
	source ~/bin/append-winpaths.sh
fi

# gpg ssh
export GPG_TTY="$(tty)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
