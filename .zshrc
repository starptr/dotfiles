# emacs mode
bindkey -e

# Up and down keys use prefix
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Define vars
export LANG_TOOLS_DIR="$HOME/.lang-tools"
export ZSH_CUSTOM="$HOME/.zsh_custom"

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

zinit light zsh-hooks/zsh-hooks

# Custom local plugin
source $ZSH_CUSTOM/iced-bell.sh

zinit ice pick"async.zsh"
zinit light mafredri/zsh-async

#zinit ice svn silent atload'prompt sorin'
#zinit snippet PZT::modules/prompt

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice wait lucid atinit"zicompinit; zicdreplay"
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
# Legacy config below; lunarvim expects neovim to be installed via homebrew on macos
# Must use `as"program"` so that lunarvim can find neovim in path
#if [ "$OS_NAME" = "Mac" ]; then
#	zinit ice wait lucid from"gh-r" as"program" ver"v0.7.0" bpick"*macos*" mv"*/bin/nvim -> nvim"
#else
#	zinit ice wait lucid from"gh-r" as"program" ver"v0.7.0" bpick"*.appimage" mv"*.appimage -> nvim"
#fi
## legacy pinned neovim (known to work)
##zinit ice wait lucid as"null" ver"4306b395defb7ef8f614127e0fbe362656346da3" atclone'rm -rf $HOME/neovim_build; make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim_build"; make -j8 install' atpull"%atclone"
#zinit light neovim/neovim

# add neovim bins to path
export PATH="$HOME/neovim_build/bin:$PATH"

# Kitty term
#zinit ice wait lucid from"gh-r" ver"latest" as"program" mv"bin/kitty -> kitty"
#zinit light kovidgoyal/kitty

# lsd
zinit ice wait lucid from"gh-r" as"program" bpick"lsd*" mv"*/lsd -> lsd" mv"*/lsd.exe -> lsd"
zinit light Peltoche/lsd

# exa
zinit ice wait lucid from"gh-r" as"null" fbin"bin/exa -> exa"
zinit light ogham/exa

# bat
zinit ice wait lucid from"gh-r" as"program" mv"*/bat -> bat"
zinit light sharkdp/bat

# ranger
zinit ice wait lucid ver"stable" as"null" fbin"ranger.py -> ranger"
zinit light ranger/ranger

# nnn
if [ "$OS_NAME" = "Linux" ]; then
  zinit ice wait lucid from"gh-r" as"null" bpick"nnn-nerd*" mv"nnn* -> nnn" fbin"nnn"
  zinit light jarun/nnn
fi

# hunter
zinit ice wait lucid from"gh-r" as"null" mv"hunter*/hunter -> hunter" fbin"hunter"
zinit light rabite0/hunter

# xplr
zinit ice wait lucid from"gh-r" as"null" fbin"xplr"
zinit light sayanarijit/xplr

# ripgrep
if [[ "$OS_NAME" = "Mac" && $IS_APL_SILIC = true ]]; then
  zinit ice wait lucid from"gh-r" as"null" bpick"*-aarch64-apple-*" fbin"rg"
  zinit light microsoft/ripgrep-prebuilt
else
  zinit ice wait lucid from"gh-r" as"null" mv"ripgrep*/rg -> rg" fbin"rg"
  zinit light BurntSushi/ripgrep
fi

# fd
zinit ice wait lucid from"gh-r" as"null" mv"fd*/fd -> fd" fbin"fd"
zinit light sharkdp/fd

# fzf
if [[ "$OS_NAME" = "Mac" && $IS_APL_SILIC = true ]]; then
zi for \
    from'gh-r'      \
    sbin'fzf'       \
    bpick'*arm64*'  \
  junegunn/fzf
else
  zi for \
      from'gh-r'  \
      sbin'fzf'   \
    junegunn/fzf
fi

# hyperfine
zinit ice wait lucid from"gh-r" as"null" mv"hyperfine*/hyperfine -> hyperfine" fbin"hyperfine"
zinit light sharkdp/hyperfine

# lazygit
if [[ "$OS_NAME" = "Mac" && $IS_APL_SILIC = true ]]; then
  zinit ice wait lucid from"gh-r" as"null" bpick"*Darwin_arm64*" fbin
else
  zinit ice wait lucid from"gh-r" as"null" fbin
fi
zinit light jesseduffield/lazygit

# install shellcheck
zinit ice wait lucid from"gh-r" as"program" mv"shellcheck-*/shellcheck -> shellcheck"
zinit light koalaman/shellcheck

# Git Credential Manager Core
#zinit ice wait lucid from"gh-r" as"program" mv"gcmcore-linux*/git-credential-manager-core -> git-credential-manager-core"
#zinit light microsoft/Git-Credential-Manager-Core

# wezterm
#zinit ice wait lucid from"gh-r" as"program" bpick"wezterm-*Ubuntu20.04.tar.xz" mv"wezterm/usr/bin/wezterm-mux-server -> wezterm-mux-server"
#zinit ice wait lucid from"gh-r" as"program" bpick"wezterm-*Ubuntu20.04.tar.xz" mv"wezterm/usr/bin/wezterm -> wezterm"
#zinit light wez/wezterm

# zellij
if [[ "$OS_NAME" = "Mac" && $IS_APL_SILIC = true ]]; then
  zinit ice wait lucid from"gh-r" as"null" bpick"*-aarch64-apple-*" fbin"zellij"
else
  zinit ice wait lucid from"gh-r" as"null" fbin"zellij"
fi
zinit light zellij-org/zellij

# dog
zinit ice wait lucid from"gh-r" as"null" mv"bin/dog -> dog" fbin"dog"
zinit light ogham/dog

# dust
zinit ice wait lucid from"gh-r" as"null" mv"dust*/dust -> dust" fbin"dust"
zinit light bootandy/dust

# procs
zinit ice wait lucid from"gh-r" as"null" fbin"procs"
zinit light dalance/procs

# bottom
zinit ice wait lucid from"gh-r" as"null" fbin"btm"
zinit light ClementTsang/bottom

# ttyper
if [[ "$OS_NAME" = "Mac" && $IS_APL_SILIC = true ]]; then
  zinit ice wait lucid from"gh-r" as"null" bpick"*-aarch64-apple-*" fbin"ttyper"
else
  zinit ice wait lucid from"gh-r" as"null" fbin"ttyper"
fi
zinit light max-niederman/ttyper

# delta
zinit ice wait lucid from"gh-r" as"program" mv"delta*/delta -> delta"
zinit light dandavison/delta

# clangd
zinit ice wait lucid from"gh-r" as"null" mv"clangd*/bin/clangd -> clangd" fbin"clangd"
zinit light clangd/clangd

# yadm completions
zinit ice wait lucid atload"zicompinit; zicdreplay" blockf pick"completion/zsh/_yadm" as"program"
zinit light TheLocehiliosan/yadm

# direnv
if [[ "$OS_NAME" = "Mac" && $IS_APL_SILIC = true ]]; then
  if [[ $IS_APL_SILIC = true ]]; then
    zinit ice lucid from"gh-r" as"program" bpick"*darwin-arm64*" mv"direnv* -> direnv" \
        atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
        pick"direnv" src="zhook.zsh"
  else
    zinit ice lucid from"gh-r" as"program" bpick"*darwin-amd64*" mv"direnv* -> direnv" \
        atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
        pick"direnv" src="zhook.zsh"
  fi
else
  zinit ice lucid from"gh-r" as"program" mv"direnv* -> direnv" \
      atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
      pick"direnv" src="zhook.zsh"
fi
zinit light direnv/direnv

# nushell
if [[ "$OS_NAME" = "Mac" && $IS_APL_SILIC = true ]]; then
  zinit ice lucid from"gh-r" as"null" bpick"*-aarch64-apple-*" fbin"nu"
else
  zinit ice lucid from"gh-r" as"null" fbin"nu"
fi
zinit light nushell/nushell

# tree-sitter-cli
# automatically insalled through npm by lunarvim
#zinit ice lucid from"gh-r" as"program" mv"tree-sitter-* -> tree-sitter-cli"
#zinit light tree-sitter/tree-sitter

# added by travis gem
[ ! -s /home/yuto/.travis/travis.sh ] || source /home/yuto/.travis/travis.sh

# Wezterm SSH
CURR_PROCESS_LIST=$(ps aux)
if [[ "$(grep "[s]shd: [^\/]" <<< "$CURR_PROCESS_LIST")" && "$(grep "[w]ezterm cli proxy" <<< "$CURR_PROCESS_LIST")" ]]; then
	source ~/bin/append-winpaths.sh
fi

# gpg ssh
export GPG_TTY="$(tty)"

# Add local bins to path
export PATH="$HOME/.local/bin:$PATH"

# doom
export PATH="$HOME/.emacs.d/bin:$PATH"

#=== PATH modifications ============================================
# Should take precedence over zinit

# Brew
if [[ "$OS_NAME" = "Linux" ]]; then
  if [ -e ~/.linuxbrew ]; then
    # Linuxbrew installed under home (possibly symlink)
    eval "$(~/.linuxbrew/bin/brew shellenv)"
  else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
elif [[ "$OS_NAME" = "Mac" ]]; then
  # For MacOS, shellenv is set in zprofile
fi

# pyenv
# TODO: use function wrapper instead of modifying path
export PYENV_ROOT="$LANG_TOOLS_DIR/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# n-install
export N_PREFIX="$LANG_TOOLS_DIR/.n"; PATH="$N_PREFIX/bin:$PATH"

# yarn
# TODO: set global bin to be under LANG_TOOLS_DIR
if command -v yarn &> /dev/null; then
	export PATH="$(yarn global bin):$PATH"
fi

# pnpm
if command -v pnpm &> /dev/null; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	export PATH="$PNPM_HOME:$PATH"
fi

# add rust bins to path
export CARGO_HOME="$LANG_TOOLS_DIR/.cargo" # NOTE: tied to Makefile
export RUSTUP_HOME="$LANG_TOOLS_DIR/.rustup" # NOTE: tied to Makefile
export PATH="$CARGO_HOME/bin:$PATH"

# Go version manager and golang paths
export GOPATH="$LANG_TOOLS_DIR/.go-bins"; export GOROOT="$LANG_TOOLS_DIR/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias ggg="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# jabba paths
export JABBA_HOME="$LANG_TOOLS_DIR/.jabba"
[ -s "$JABBA_HOME/jabba.sh" ] && source "$JABBA_HOME/jabba.sh"

# ruby paths
export RBENV_ROOT="$LANG_TOOLS_DIR/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
if command -v rbenv &> /dev/null; then
	eval "$(rbenv init -)"
fi

# Add texlive to path
export PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"
export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH"

# Add user bins to path
export PATH="$HOME/bin:$PATH"

# Run instructional script
if [ -f "$HOME/.zshrc.instructional" ]; then
  source ~/.zshrc.instructional
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Define nix path for home-manager
# See https://nix-community.github.io/home-manager/index.html#sec-install-standalone:~:text=export%20NIX_PATH%3D%24HOME/.nix%2Ddefexpr/channels%3A/nix/var/nix/profiles/per%2Duser/root/channels%24%7BNIX_PATH%3A%2B%3A%24NIX_PATH%7D
# TODO: separate this into a shared rc file for both bash and zsh
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
