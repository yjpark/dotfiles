
## tlp

- http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html

Common setup
```
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
```

Thinkpad extra
```
sudo apt-get install tp-smapi-dkms acpi-call-tools
```

## tpfanco

Thinkpad fan control

```
sudo add-apt-repository ppa:vl-sht/tpfanco
sudo apt-get update
sudo apt-get install tpfan-admin tpfand-profiles
```
