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
Add the following lines indented under an iface in file /etc/network/interfaces
```
        dns-nameserver 8.8.8.8
        dns-nameserver 8.8.4.4
```
