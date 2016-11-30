# https://my.zerotier.com
- Login with Google: yjpark@gmail.com

# Notes

## Need to assign IP address manually for now

```
sudo ifconfig zt0 10.10.1.xxx netmask 255.255.255.0 up
```

## Use on nixos
- Need to run as root
```
sudo zerotier-one -d
```

- use zerotier-cli to join network, also need to use root

