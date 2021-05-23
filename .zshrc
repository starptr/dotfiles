#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# Customize to your needs...

# Define vars
export ZSH_CUSTOM="$HOME/.zsh_custom"

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
export MANPATH="/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH"


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
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
	zinit-zsh/z-a-submods

### End of Zinit's installer chunk

alias zce="zinit ice"

zinit snippet PZTM::environment
zinit snippet PZT::modules/terminal
zinit snippet PZT::modules/editor
zinit snippet PZT::modules/history
zinit snippet PZT::modules/directory
zinit snippet PZT::modules/spectrum
zinit snippet PZT::modules/utility
zinit snippet PZT::modules/ssh
zinit snippet PZT::modules/completion
#zinit snippet PZT::modules/ruby
zinit ice silent
zinit snippet PZT::modules/git
#zinit snippet PZT::modules/history-substring-search
#zinit snippet PZTM::syntax-highlighting

# Custom aliases
source $ZSH_CUSTOM/aliases.sh

zinit ice wait lucid
zinit load zdharma/fast-syntax-highlighting

setopt promptsubst

#PS1="READY >"

zinit ice pick"async.zsh"
zinit light mafredri/zsh-async

zinit ice svn silent atload'prompt sorin'
zinit snippet PZT::modules/prompt

#zinit ice depth=1
#zinit light romkatv/powerlevel10k

zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'
zstyle ':prezto:module:python:virtualenv' initialize 'yes'
zinit ice wait lucid
zinit snippet PZT::modules/python

# Neovim
zinit ice wait lucid from"gh-r" as"program" bpick"*.appimage" mv"*.appimage -> nvim"
zinit light neovim/neovim

zinit ice wait lucid from"gh-r" as"program" bpick"*-x86_64-unknown-linux-gnu*" mv"*-x86_64-*/lsd -> lsd"
zinit light Peltoche/lsd

# added by travis gem
[ ! -s /home/yuto/.travis/travis.sh ] || source /home/yuto/.travis/travis.sh
