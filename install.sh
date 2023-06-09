#!/bin/bash

mirror_service() {
    sudo pacman -Syy rsync reflector --no-confirm
    sudo systemctl enable reflector rsyncd
    sudo systemctl start rsyncd
    sudo reflector -c Uzbekistan -a 24 --sort rate --save /etc/pacman.d/mirrorlist
}

system_service() {
    yes | sudo pacman -Rns dracut yay
    yes | sudo pacman -S linux linux-headers mkinitcpio micro zsh git curl telegram-desktop wget neofetch ninja clang cmake gcc nodejs npm pnpm 
}

aur_tools() {
    if [ -f /usr/bin/yay ]; then
        yes | sudo pacman -Rns yay
        cd ~/Documents/
        git clone https://aur.archlinux.org/paru-bin
        cd paru-bin
        makepkg -si
        paru -Syy mkinitcpio-firmware google-chrome visual-studio-code-bin android-studio ulauncher flameshot
    else
        cd ~/Documents/
        git clone https://aur.archlinux.org/paru-bin
        cd paru-bin
        makepkg -si
        paru -Syy mkinitcpio-firmware google-chrome visual-studio-code-bin android-studio ulauncher flameshot
    fi
}

zsh_install() {
    if [ -f /usr/bin/zsh ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        rm -rf ~/.zshrc; cp ./.zshrc ~/
    else
        sudo pacman -S zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        rm -rf ~/.zshrc; cp ./.zshrc ~/
    fi
}

clean_service() {
    sudo rm -rf /var/cache/pacman/pkg*
    rm -rf ~/.cache/*
}

reboot_service() {
    sudo systemctl reboot -i
}

# Skript boshlanishi

mirror_service
system_service
aur_tools
zsh_install
clean_service
reboot_service