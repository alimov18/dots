#!/bin/bash

mkfs.vfat /dev/nvme0n1p1
mkswap /dev/nvme0n2
mkfs.ext4 /dev/nvme0n3

mount /dev/nvme0n3 /mnt
mkdir -p /mnt/boot/efi
mount /dev/nvme0n1 /mnt/boot/efi
swapon /dev/nvme0n1p2

pacstrap /mnt base base-devel linux linux-firmware linux-headers micro grub efibootmgr dosfstools mtools os-prober intel-ucode wireless_tools mtools wpa_supplicant networkmanager netctl curl wget neofetch bluez bluez-utils arp-scan net-tools xdg-user-dirs telegram-desktop git pavucontrol pulseaudio pulseaudio-alsa sof-firmware openssh vlc ffmpeg xf86-input-syntaptics xf86-video-intel intel-gmmlib intel-graphics-compiler vulkan-intel mesa intel-gpu-tools intel-media-driver lib32-libva-intel-driver lib32-vulkan-intel whois nmap nodejs
genfstab -U -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt passwd
arch-chroot /mnt useradd -m -G wheel anvar
arch-chroot /mnt passwd anvar
arch-chroot /mnt echo "hp" >> /etc/hostname
arch-chroot /mnt echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
arch-chroot /mnt echo "LANG=en_US.UTF-8" >> /etc/locale.conf
arch-chroot /mnt locale-gen
arch-chroot /mnt ln -sf /usr/share/zoneinfi/Asia/Tashkent /etc/localtime
arch-chroot /mnt hwclock --systohc --utc
arch-chroot /mnt echo "KEYMAP=us" >> /etc/vconsole.conf
arch-chroot /mnt EDITOR=micro visudo

arch-chroot /mnt yes | sudo pacman -Syy xarchiver e2fsprogs xfcprogs ip2route rsyncd 
arch-chroot /mnt systemctl enable NetworkManager sshd wpa_supplicant rsyncd


echo "grubinstall, mkinitcpio va exit senga qoldi ))"

# bir balolar................

