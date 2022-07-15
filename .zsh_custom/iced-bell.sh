#!/bin/zsh

typeset -ag iced_functions;
typeset -ag iced_functions_iced;

# This function is called in precmd
# It checks a list of functions, calls each of them, and clears the list
function iced-fn-melt() {
  typeset -ag iced_functions;
  typeset -ag iced_functions_iced;
  iced_functions_iced=($iced_functions)
  iced_functions=()
  for iced_fn in $iced_functions_iced; do
    $iced_fn;
  done
}

# Add a function to list of ices
function iced-fn-add() {
  typeset -ag iced_functions;
  iced_functions+=("$1")
}

# Notifies when the command is done
function manual-bell() {
  echo "Bell!"
}

function add-manual-bell-to-ice() {
  echo "added!"
  iced-fn-add manual-bell
}
zle -N add-manual-bell-to-ice

bindkey "^[p" add-manual-bell-to-ice

typeset -ag precmd_functions;
precmd_functions+=(iced-fn-melt)
