#!/bin/bash

## first works
clear
yay -Syy paru-bin
paru -Rns yay


## Reflector
sudo pacman -Syy reflector rsync
sudo systemctl enable reflector rsyncd
sudo systemctl start rsyncd
sudo reflector -c Uzbekistan -a 24 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

## Remove packages
sudo pacman -Rns dracut

## Install packages
sudo pacman -Syy linux mkinitcpio micro clang cmake ninja unzip unrar zsh flameshot ttf-cascadia-code-nerd ttf-fantasque-nerd
paru -S mkinitcpio-firmware android-studio google-chrome visual-studio-code-bin ulauncher

## Shell
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Git settings

git config --global user.email "cosmoasx@gmail.com"
git config --global user.name "Anvar"

clear

#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
