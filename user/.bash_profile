#!/bin/bash
##       ____             __
##      / __ \_________ _/ /_____
##     / / / / ___/ __ `/ //_/ _ \
##    / /_/ / /  / /_/ / ,< /  __/  Clay Gomera (Drake)
##   /_____/_/   \__,_/_/|_|\___/   My custom bash_profile config
##
#

# Home folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

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
export TERMINAL="wezterm"
export RUNNER="fuzzel --dmenu"
export RUNNER_EX="fuzzel"
export EDITOR="$HOME/.local/bin/lvim"
export VISUAL="neovide --neovim-bim $HOME/.local/bin/lvim"
export BROWSER="firefox"
export VIEWER="zathura"

#ENV
export XDG_SESSION_DESKTOP=Hyprland
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export XKB_DEFAULT_LAYOUT="us"
export MOZ_ENABLE_WAYLAND=1
export GTK_THEME="gruvbox-dark-gtk"
export GTK_ICON_THEME="gruvbox-dark-gtk"
export XCURSOR_THEME=Simp1e-Gruvbox-Dark
export XCURSOR_SIZE=16

# Bashrc
source "$BASHRC"

# Create config directories if they don't exist
if [ ! -d "$WGETDIR" ] || [ ! -d "$GNUPGHOME" ]; then
    mkdir -p "$WGETDIR" "$GNUPGHOME"
    touch "$WGETDIR"/wgetrc
fi
