#!/bin/sh
##       ____             __
##      / __ \_________ _/ /_____
##     / / / / ___/ __ `/ //_/ _ \
##    / /_/ / /  / /_/ / ,< /  __/  Clay Gomera (Drake)
##   /_____/_/   \__,_/_/|_|\___/   My custom bash_profile config
##

### STARTING XSESSION
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]
then
  startx -- vt1 -keeptty &>/dev/null
  logout
fi

### ENVIRONMENT VARIABLES
export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode
export READER="zathura"                           # Zathura as the pdf viewer
export TERMINAL="alacritty"                       # Alacritty as the default terminal emulator
export BROWSER="qutebrowser"                      # Qutebrowser as the default web browser
export WM="awesome"                               # Awesomewm as the default Window Manager
export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME/.local/share"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME/.cache"}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"

### BASHRC
source "$HOME"/.bashrc                            # Load the bashrc
