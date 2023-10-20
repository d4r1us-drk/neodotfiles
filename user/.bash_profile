#!/bin/bash
##       ____             __
##      / __ \_________ _/ /_____
##     / / / / ___/ __ `/ //_/ _ \
##    / /_/ / /  / /_/ / ,< /  __/  Clay Gomera (Drake)
##   /_____/_/   \__,_/_/|_|\___/   My custom bash_profile config
##

# starting xsession
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]
then
  startx -- vt1 -keeptty &>/dev/null
  logout
fi

# environment variables
export EDITOR="~/.local/bin/lvim"
export VISUAL="~/.local/bin/neovide.AppImage --neovim-bin $EDITOR"
export BROWSER="qutebrowser"
export VIEWER="zathura"

# clean home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DESKTOP_DIR="$HOME/var/desktop"
export XDG_DOWNLOAD_DIR="$HOME/var/downloads"
export XDG_TEMPLATES_DIR="$HOME/media/documents/templates"
export XDG_PUBLICSHARE_DIR="$HOME/var/public"
export XDG_DOCUMENTS_DIR="$HOME/media/documents"
export XDG_MUSIC_DIR="$HOME/media/music"
export XDG_PICTURES_DIR="$HOME/media/pictures"
export XDG_VIDEOS_DIR="$HOME/media/videos"
export W3M_DIR="$XDG_DATA_HOME/w3m"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export GNUPGHOME="$HOME/.local/share/gnupg"
export LESSHISTFILE="-"
[ ! -d "$HOME/.config/wget/" ] && [ ! -d "$GNUPGHOME" ] && mkdir -p "$HOME/.config/wget/" "$GNUPGHOME"

# bashrc
source "$HOME"/.bashrc
