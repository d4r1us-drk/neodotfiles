#!/bin/bash
##       ____             __
##      / __ \_________ _/ /_____
##     / / / / ___/ __ `/ //_/ _ \
##    / /_/ / /  / /_/ / ,< /  __/  Clay Gomera (Drake)
##   /_____/_/   \__,_/_/|_|\___/   My custom bash_profile config
##

### STARTING XSESSION
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]
then
  startx -- vt1 -keeptty &>/dev/null
  logout
fi

### ENVIRONMENT VARIABLES
export EDITOR="lvim"                                             # $EDITOR use lunarvim in terminal
export VISUAL="neovide --neovim-bin ./.local/bin/lvim"           # $VISUAL use neovide for lunarvim in GUI
export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME/.local/share"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME/.cache"}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"

### BASHRC
source "$HOME"/.bashrc                            # Load the bashrc
