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
