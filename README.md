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
# Touchpad configuration
Edit /etc/X11/xorg.conf.d/30-touchpad.conf
```
Section "InputClass"
    Identifier "devname"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "ClickMethod" "clickfinger"
    Option "NaturalScrolling" "true"
EndSection
```
# Google DNS for debian
Remove all the lines regarding the physical ethernet controllers from /etc/network/interfaces file. Then configure them from Network Manager GUI

# Installing Julia
Download tar.gz from julia website and upack it in /opt folder, then create a link:
```
sudo ln -s /opt/julia-version/bin/julia /usr/local/bin/julia
```

# virsh network config
To list which networks have been defined to the libvirt daemon for use by KVM guests
```
virsh net-list --all
```
To edit the default network
```
virsh  net-edit  default
```
Add dns and dhcp to the default network
```
<network>
  <name>default</name>
  <uuid>aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:xx:yy:zz'/>
  <dns forwardPlainNames='no'>
    <forwarder domain='example.lan' />
    <host ip='192.168.X.1'>
      <hostname>host</hostname>
      <hostname>host.example.lan</hostname>
    </host>
  </dns>
  <ip address='192.168.X.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.X.2' end='192.168.X.254'/>
    </dhcp>
  </ip>
</network>
```
Activate the modified configuration
```
virsh net-destroy default
virsh net-start default
```
Check on Fedora doc in order to use dnsmasq plugin for DNS
