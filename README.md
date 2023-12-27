# DRK's dotfiles (awesome)
This repository contains the dotfiles for my awesome window manager setup. This
setup uses the latest awesome git build.

Feel free to explore the configuration files and adapt them to your
preferences. If you have any questions or suggestions, please open an issue in
this repository.

### Dependencies

### Dependencies to build awesome
``` sh
sudo xbps-install -S xorg-server xorg-input-drivers libX11 libX11-devel libXinerama libXinerama-devel libXft libXft-devel libXrandr libXrandr-devel imlib2 imlib2-devel harfbuzz harfbuzz-devel freetype freetype-devel gd gd-devel gdk-pixbuf gdk-pixbuf-devel xcb-util-cursor xcb-util-cursor-devel xcb-util-keysyms xcb-util-keysyms-devel xcb-util-image xcb-util-image-devel xcb-util-xrm xcb-util-xrm-devel xcb-util-wm xcb-util-wm-devel libxkbcommon libxkbcommon-devel libxkbcommon-x11 startup-notification startup-notification-devel libxdg-basedir libxdg-basedir-devel lua54 lua52 lua54-lgi lua54-devel lua52-devel lua52-lgi
```

### Supplemental dependencies
``` sh
sudo xbps-install -S brightnessctl picom pamixer pulsemixer fd ripgrep jq fzf eza bat arandr playerctl nerd-fonts noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-cjk noto-fonts-emoji cantarell-fonts newsboat vifm cmus cmus-ffmpeg kvantum gtk-engine-murrine zathura zathura-pdf-poppler j4-dmenu-desktop maim slop feh nsxiv chafa xdpyinfo xdotool
```

### Dev dependencies
``` sh
sudo xbps-install -S base-devel cmake clang llvm rust cargo nodejs vala
```

### VMs & Containers dependencies
``` sh
sudo xbps-install -S libvirt virt-manager qemu iptables-nft dnsmasq openbsd-netcat dmidecode podman
```
