#!/bin/bash
sudo pacman -Syy xfce4 xfce4-goodies network-manager-applet xfce4-whisker-menu-plugin lightdm lightdmgtk-greeter xorg xorg-server xorg-fonts
sudo systemctl enable lightdm
sudo mkinitcpio -p linux
