# Fedora Configuration
After minimal install (C development), add RMP Fusion repo from Fedora quick docs.

## Installed plasma and libs 
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
sudo dnf install fftw-devel libdb-cxx-devel leveldb-devel hdf5-devel highfive-devel lapack-devel rapidjson-devel boost cmake ninja-build
```
