#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Skip any compinits
skip_global_compinit=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# WSL-only config
if [[ -n "$IS_WSL" || -n "$WSL_DISTRO_NAME" ]]; then
  # X-server support
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
  export LIBGL_ALWAYS_INDIRECT=1
  sudo /etc/init.d/dbus start &> /dev/null
  
  # GUI theme
  export GDK_THEME=Greybird-dark
  export QT_STYLE_OVERRIDE=Greybird-dark
fi
