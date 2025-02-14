# General configurration for arch
## Suspend lid switch
Edit file /usr/lib/systemd/logind.conf
```
HandleLidSwith=ignore
HandleLidSwitchDocked=ignore
```
## Installing developemtne libraries
```
sudo paru -S fftw boost boost-libs db leveldb hdf5 highfive lapack rapidjson cmake ninja
```

# General configuration for fedora
This are general configuration for fedora distro

## Install google-chrome
```
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf install google-chrome
```

## Fonts
```
sudo dnf install google-noto-*
sudo dnf install liberation-fonts-all
sudo dnf install source-foundry-hack-fonts
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

# Wayland based configuration
Wayland based configuration for fedora
```
sudo dnf install sway
sudo dnf install NetworkManager-tui
sudo dnf group install multimedia
sudo dnf isntall mpv
sudo dnf install pactl pavucontrol
sudo dnf isntall zathura zathura-djvu zathura-pdf-mupdf zathura-ps
sudo dnf install xdg-desktop-portal-wlr
sudo dnf install clang clang-tools-extra
```
Monitor info can be obtained via
```
swaymsg -t get_outputs
```
In sway a layout configuration stores how much of the output space is allocated for a sway_container. In addition a single outut could be sudbdivided in to multiple layouts. For example for subdividing a 1080p in to two layouts:
```
output HDMI-1 res 1920x1080 layout 960x1080@0,0 layout 960x1080@960,0
```
If no layout is specified, the default layout is used with WxH@0,0. In addition the `layout none` option could be used.
A simple configuration example could be
```
output HDMI-1 res 1920x1080
output DP-1 res 1920x1080 pos 1920,0
```
Mirroring could be configured via the mirror option
```
output HDMI-1 res 1920x1080
output DP-1 layout none mirror HDMI-1
```
It is also possible to use different resolutions
```
output DP-1 res 1280x720
output HDMI-1 res 1920x1080 mirror DP-1
```
Mirroring could be alsoused by adjusting the posistion of the monitors. Workspaces could also be bynded to a particular monitor
```
workspace 1 output DP-1
```
The keyboard and touchpad can be configured as
```
input "type:keyboard" {
    xkb_layout us
    xkb_variant alt-intl
    xkb_options ctrl:nocaps
}
```
```
input "type:touchpad" {
    tap enabled
    natural_scroll enabled
    dwt enabled
    tap_button_map lrm
}
```


# Xorg based configuration
Xorg based configuration for fedora

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

## KDE Desktop on X11
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

# Genral VM server configuration
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
## virsh add static ip with network configuration
Add host in dhcp section
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
      <host mac='VM MAC ADDRES' name='VM NAME' ip='STATIC IP TO BE ASSIGNED TO VM' />
    </dhcp>
  </ip>
</network>
```

## Port forwarding from vms under NAT
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
To restart service
```
service nftables restart
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
## Manage virtual machines
List all machine
```
virsh list --all
```
Clone a virtual machine
```
virt-clone --original {Domain-Vm-Name-Here} --name {New-Domain-Vm-Name-Here} --file {/var/lib/libvirt/images/File.Name.here}
```
