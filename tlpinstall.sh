#!/bin/bash
sudo pacman -Syyy tlp
sudo systemctl enable tlp
sudo systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
sudo systemctl start tlp
sudo tlp start

echo "reboot qil"