# Fedora Configuration
After minimal install (C development), add RMP Fusion repo from Fedora quick docs.

## BSPWM Display Nanager
Install base system
```
sudo dnf install @base-x
sudo dnf install xrandr
sudo dnf install NetworkManager-tui
sudo dnf group install multimedia
sudo dnf install bspwm sxhkd dmenu
sudo dnf install kitty
sudo dnf install mesa-libegl-devel pactl pavucontrol
sudo dnf isntall mpv
sudo dnf isntall zathura zathura-djvu zathura-pdf-mupdf zathura-ps
```

## KDE Desktop
```
sudo dnf install plasma-workspace-x11
sudo dnf install konsole
sudo dnf install dolphin dolphin-plugins
sudo dnf install pciutils
sudo dnf install NetworkManager-tui
sudo dnf install plasma-nm
sudo dnf install kscreen
sudo dnf install mpv
sudo dnf install ark
```
## Gnome Desktop
```
sudo dnf install gnome-session-xsession
sudo dnf install gnome-tweaks
sudo dnf install nautilus
sudo dnf install gnome-terminal gnome-terminal-nautilus
sudo dnf install pciutils
sudo dnf install NetworkManager-tui
sudo dnf group install multimedia
sudo dnf install mpv
sudo dnf install eog
sudo dnf search gnome-text-editor
sudo dnf install f41-backgrounds-gnome
```
## Install google-chrome
```
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf install google-chrome
sudo dnf install google-noto-*
```


## Installing developement libraries
```
sudo dnf install fftw-devel libdb-cxx-devel leveldb-devel hdf5-devel highfive-devel lapack-devel rapidjson-devel boost boost-devel cmake ninja-build
```

## Suppres hibernation suspend and lid
```
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
edit file /usr/lib/systemd/logind.conf
```
HandleLidSwith=ignore
HandleLidSwitchDocked=ignore
```
