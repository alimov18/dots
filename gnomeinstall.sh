#!/bin/bash
sudo pacman -Syy gnome gdm xorg xorg-server
sudo systemctl enable gdm
sudo mkinitcpio -p linux
echo "reboot qil"