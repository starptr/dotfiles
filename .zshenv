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
if [[ "$IS_WSL" = true || -n "$WSL_DISTRO_NAME" ]]; then
	export IS_WSL=true
  # X-server support
  # legacy code due to wslg
  #export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
  #export LIBGL_ALWAYS_INDIRECT=1
  #sudo /etc/init.d/dbus start &> /dev/null

  # GUI theme
  #export GDK_THEME=Greybird-dark
  #export QT_STYLE_OVERRIDE=Greybird-dark
else
	export IS_WSL=false
fi

export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

# Create env var to expose OS
OS_ID="$(uname -s)"
case "${OS_ID}" in
	Linux*) OS_NAME=Linux;;
	Darwin*) OS_NAME=Mac;;
	*) OS_NAME=Other;;
esac
export OS_NAME

if [[ "$OS_NAME" = "Mac" ]]; then
  if [[ "$(uname -m)" = "arm64" ]]; then
    IS_APL_SILIC=true
  else
    IS_APL_SILIC=false
  fi
  export IS_APL_SILIC
fi

# Run instructional script if in an instructional env
if [ -f "~/.zshenv.instructional" ]; then
    source ~/.zshenv.instructional
fi
