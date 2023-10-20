# Keyboard configuration
Edit /etc/X11/xorg.conf.d/00-keyboard.conf
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us"
        Option "XkbModel" "pc104"
        Option "XkbVariant" "intl"
        Option "XkbOptions" "ctrl:nocaps"
EndSection
```
Reload keyboard configuration
```
sudo setxkbmap
```
# Google DNS
Remove all the lines regarding the physical ethernet controllers from /etc/network/interfaces file. Then configure them from Network Manager GUI

# Staf for c++
```
sudo apt install build-essential git cmake ninja-build libfftw3-dev libboost-all-dev libvtk9-dev libhdf5-dev libdb-dev libdb++-dev libleveldb-dev
```

# Installing Julia
Download tar.gz from julia website and upack it in /opt folder, then create a link:
```
sudo ln -s /opt/julia-version/bin/julia /usr/local/bin/julia
```

# Starting x11vnc
Starting logged in:
```
x11vnc -display :0
```
Starting logged out with kde (sddm):
```
x11vnc -display :0 -auth $(find /var/run/sddm/ -type f)
```

# Fedora minimal gnome
```
# base
sudo dnf install @base-x @Fonts @Multimedia gnome-shell gnome-console nautilus gnome-tweaks gnome-system-monitor gnome-disk-utility gnome-text-editor eog gnome-calculator celluloid rhythmbox file-roller gnome-session-xsession NetworkManager-wifi xdg-user-dirs xdg-user-dirs-gtk xdg-utils xdg-desktop-portal-gnome gvfs* git bash-completion systemd-boot-unsigned wget unzip -y
sudo systemctl enable gdm bluetooth NetworkManager

# repo
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
```
