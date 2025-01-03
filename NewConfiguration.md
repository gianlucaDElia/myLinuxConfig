# Fedora Configuration
After minimal install (C development), add RMP Fusion repo from Fedora quick docs.

## Xmonad Display Nanager
Install base system
```
sudo dnf install @base-x
sudo dnf install xrandr
sudo dnf install NetworkManager-tui
sudo dnf group install multimedia
sudo dnf install xmonad ghc-xmonad-contrib{,-devel} xmobar
sudo dnf install libxkbcommon-x11 alacritty
sudo dnf install feh
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

## Install google-chrome
```
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf install google-chrome
```


## Installing developement libraries
```
sudo dnf install fftw-devel libdb-cxx-devel leveldb-devel hdf5-devel highfive-devel lapack-devel rapidjson-devel boost boost-devel cmake ninja-build
```
