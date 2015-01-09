Setup KVM on Ubuntu

- http://hinish.com/?p=338

Setup network bridge

`/etc/network/interfaces` need to comment out the original wired link, and setup br0 with it
```
# The primary network interface
# auto p2p1
# iface p2p1 inet dhcp

auto br0
iface br0 inet dhcp

bridge_ports p2p1

```
Create br0 and attach tap0 to it
```
brctl addbr br0 
brctl addif br0 p2p1
openvpn --mktun --dev tap0
ifconfig tap0 0.0.0.0 up
brctl addif br0 tap0
```

Then when start the qemu, use this for network
```
-net nic,macaddr=00:15:5D:CC:E7:BF -net tap,ifname=tap0,script=no
```
