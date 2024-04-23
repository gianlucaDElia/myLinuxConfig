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

# Debian server
## Google DNS
Remove all the lines regarding the physical ethernet controllers from /etc/network/interfaces file. Then configure them from Network Manager GUI
## Installing Julia
Download tar.gz from julia website and upack it in /opt folder, then create a link:
```
sudo ln -s /opt/julia-version/bin/julia /usr/local/bin/julia
```
## virsh network config
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
# Port forwarding from vms under NAT
Enable nftables
```
systemctl enable nftables
```
Check if ip forwarding is enable
```
sysctl net.ipv4.ip_forward
```
output 1 means enabled, if output is 0 eneble it by
```
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
```
and reboot.
To list all the active rules
```
nft list ruleset
```
To clean all rules
```
nft flush ruleset
```
Create nat rules with portforwarding
```
nft add table nat
nft 'add chain nat postrouting { type nat hook postrouting priority 100 ; }'
nft 'add chain nat prerouting { type nat hook prerouting priority -100; }'
nft 'add rule nat prerouting iif eth0 tcp dport { number1 } dnat to 192.168.X.2:number2'
nft add rule nat postrouting masquerade
```
Make rules permanent:
```
cp /etc/nftables.conf /etc/nftables.conf.back
nft list ruleset | tee /etc/nftables.conf
```
