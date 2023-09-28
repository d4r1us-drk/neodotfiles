#!/usr/bin/env bash

echo -e "Replacing flatpak apps...\nPlease answer yes to everything...\n";
flatpak remove org.fedora.Platform
installed=$(flatpak list --columns=application --app);
flatpak remove --assumeyes --all;
flatpak remote-modify --disable fedora;
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo;
flatpak install --assumeyes org.mozilla.firefox org.libreoffice.LibreOffice org.gnome.Boxes org.gnome.Snapshot org.gnome.SimpleScan org.gnome.Loupe org.gnome.Geary com.mattjakeman.ExtensionManager "$installed";
flatpak remove --assumeyes org.gnome.eog org.gnome.Extensions org.gnome.Cheese org.gnome.baobab;

echo -e "Installing some things and overriding system packages...\nPlease answer yes to everything...\n";
rpm-ostree install --assumeyes distrobox baobab cryfs && rpm-ostree override remove firefox firefox-langpacks;

echo -e "Installing adw-gtk3...\n";
mkdir -p "$HOME/.local/share/themes";
wget https://github.com/lassekongo83/adw-gtk3/releases/download/v4.9/adw-gtk3v4-9.tar.xz && tar -xvf ./adw-gtk3v4-9.tar.xz;
rm -f adw-gtk3v4-9.tar.xz;
mv adw-gtk3* "$HOME/.local/share/themes/";
flatpak install --assumeyes org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark;

while true; do
    echo -e "Do you want to set light or dark mode? Answer 'light' or 'dark': ";
    read -r mode

    if [ "$mode" == "light" ]; then
        gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
        gsettings set org.gnome.desktop.interface color-scheme 'default'
        echo -e "Light mode set.\n"
        break
    elif [ "$mode" == "dark" ]; then
        gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
        	
        echo -e "Dark mode set.\n"
        break
    else
        echo -e "Invalid mode selected. Please enter 'light' or 'dark'."
    fi
done

echo "Done!\n";
exit 0;
