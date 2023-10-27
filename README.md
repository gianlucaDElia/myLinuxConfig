# Keyboard configuration
Edit /etc/X11/xorg.conf.d/00-keyboard.conf
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us"
        Option "XkbVariant" "alt-intl"
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
