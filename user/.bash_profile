#!/bin/sh
### STARTING XSESSION
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]
then
  startx
fi

### ENVIRONMENT VARIABLES
export GST_VAAPI_ALL_DRIVERS=1
export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode
export READER="zathura"                           # Zathura as the pdf viewer
export TERMINAL="alacritty"                       # Alacritty as the default terminal emulator
export BROWSER="qutebrowser"                      # Qutebrowser as the default web browser
export WM="awesome"                               # AwesomeWM as the default Window Manager
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export QT_QPA_PLATFORMTHEME=gtk2                  # Qt theeming stuff

### AUTOSTART
/usr/bin/emacs --daemon &                         # Autostart the Emacs daemon

### BASHRC
source "$HOME"/.bashrc                            # Load the bashrc