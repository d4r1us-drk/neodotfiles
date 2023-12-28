# DRK's dotfiles (awesome)
This repository contains the dotfiles for my awesome window manager setup. This
setup uses the latest awesome git build.

Feel free to explore the configuration files and adapt them to your
preferences. If you have any questions or suggestions, please open an issue in
this repository.

THIS SETUP IS WIP.

## Dependencies
These commands are for setting up a new arch install with my dotfiles. These
include all the things I personally use, so I don't recommend just copying and
pasting these into your current install, just take a look at the configs and
grab what you'll absolutely need.

### Main dependencies
``` sh
paru -S awesome-git rofi betterlockscreen-git ueberzugpp unclutter-xfixes-git polkit-gnome acpi power-profiles-daemon python-gobject xorg-server xorg-xev xorg-xprop xorg-setxkbmap xorg-xinit xorg-xkill xorg-xrandr xclip xf86-input-evdev xf86-input-libinput xf86-input-wacom bluez bluez-tools bluez-utils neovim udisks2 pipewire pipewire-pulse pipewire-jack pipewire-alsa pipewire-audio pipewire-v4l2 wireplumber brightnessctl xorg-xdpyinfo xdotool maim slop jq fd eza bat starship playerctl ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ttf-mononoki-nerd cantarell-fonts picom mpv pamixer vifm ffmpegthumbnailer epub-thumbnailer-git ripgrep fzf eza bat arandr pulsemixer noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-cjk noto-fonts-emoji newsboat cmus kvantum gtk-engine-murrine zathura zathura-pdf-poppler nsxiv chafa qutebrowser
```

### Dev dependencies
``` sh
paru -S --needed base-devel cmake clang llvm rust cargo nodejs vala
```

### VMs & Containers dependencies
``` sh
paru -S --needed libvirt virt-manager qemu-full iptables-nft dnsmasq openbsd-netcat dmidecode podman podman-compose
```
