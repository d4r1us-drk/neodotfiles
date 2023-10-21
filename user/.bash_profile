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
  sh "$HOME/.winitrc"
  logout
fi

# environment variables
export EDITOR="$HOME/.local/bin/lvim"
export VISUAL="$HOME/.local/bin/lvim"
export BROWSER="firefox"
export VIEWER="zathura"
export WM=dwl

# home folders
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

# clean home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export W3M_DIR="$XDG_DATA_HOME/w3m"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export GNUPGHOME="$HOME/.local/share/gnupg"
export LESSHISTFILE="-"
[ ! -d "$HOME/.config/wget/" ] && [ ! -d "$GNUPGHOME" ] && mkdir -p "$HOME/.config/wget/" "$GNUPGHOME"

# bashrc
source "$HOME"/.bashrc
