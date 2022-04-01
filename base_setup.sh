#!/bin/bash

ln -sf /user/share/zoneinfo/Europe/Rome /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "gianOnArch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 gianOnArch.localdomain gianOnArch" >> /etc/hosts
echo root:password | chpasswd

# General packages 
pacman -S grub efibootmgr intel-ucode dhcpcd networkmanager network-manager-applet netwokmanager-openvpn \
        mtools dosfstools ntfs-3g linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils \
        inetutils dnsutils bluez bluez-utils cups cups-pdf hplip alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluez pavucontrol\
        bash-completion openssh acpid polkit-gnome lxappearance noto-fonts ttf-roboto ttf-hack

# Xorg and nvidia
pacman -S xorg xorg-xinit xorg-xrandr nvidia nvidia-utils

# Boot loader
grub-install --target=x86_64-efi --efi-directory=boot --bootloader-id=GRUB 

grub-mkconfig -o /boot/grub/grub.cfg

# Adding user
useradd -m -G ftp,http,sys,wheel,dbus,audio,disk,input,storage,video -s /bin/bash gian
echo gian:password | chpasswd

# Service enable
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable acpid
