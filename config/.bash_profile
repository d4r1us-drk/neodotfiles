#!/usr/bin/env bash

# Home folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

# X11
export X11CFGDIR="$XDG_CONFIG_HOME/X11"
export X11LOGDIR="$XDG_CACHE_HOME/X11Logs"
export XINITRC="$X11CFGDIR/xinitrc"

# Sanely export XDG Base dir variables
eval "$(sed 's/^[^#].*/export &/g;t;d' ~/.config/user-dirs.dirs)"

# Clean home
export W3M_DIR="$XDG_DATA_HOME/w3m"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export WGETDIR="$XDG_CONFIG_HOME/wget"
export WGETRC="$WGETDIR/wgetrc"
export INPUTRC="$HOME/.config/X11/inputrc"
export GNUPGHOME="$HOME/.local/share/gnupg"
export LESSHISTFILE="-"
export BASHRC="$HOME/.bashrc"

# Default apps
export TERMINAL="st"
export EDITOR="$HOME/.local/bin/lvim"
export VISUAL="st -e $EDITOR"
export BROWSER="flatpak run org.mozilla.firefox"
export VIEWER="zathura"

# Bashrc
source "$BASHRC"

# Create config directories if they don't exist
if [ ! -d "$WGETDIR" ] || [ ! -d "$GNUPGHOME" ] || [ ! -d "$X11LOGDIR" ]; then
    mkdir -p "$WGETDIR" "$GNUPGHOME" "$X11LOGDIR"
fi

# Starting xsession
export X11LOGFILE=$(mktemp --tmpdir="$X11LOGDIR" X11LOG.XXXXXX)
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    startx "$XINITRC" -- vt1 -keeptty &>> "$X11LOGFILE"
    logout
fi
