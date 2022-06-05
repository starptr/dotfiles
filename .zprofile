#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/.local/bin
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Brew
if [[ "$OS_NAME" = "Linux" ]]; then
  if [ -e ~/.linuxbrew ]; then
    # Linuxbrew installed under home (possibly symlink)
    eval "$(~/.linuxbrew/bin/brew shellenv)"
  else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
elif [[ "$OS_NAME" = "Mac" ]]; then
  if [[ "$(uname -m)" = "arm64" ]]; then
    # apple silicon
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    # TODO: handle x86-64 apple
  fi
fi
export PATH=$PATH:/Users/ynishida/src/game-engine/Tools/Utilexport PATH=$PATH:/Users/ynishida/src/game-engine/Tools/Util

# Run instructional script if in an instructional env
if [ -f "$HOME/.zprofile.instructional" ]; then
    source ~/.zprofile.instructional
fi
