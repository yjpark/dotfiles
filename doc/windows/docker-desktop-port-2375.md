# In case of docker desktop not listening 2375

- https://github.com/docker/for-win/issues/3546

###  Windows reserves port 2375:

```
netsh interface ipv4 show excludedportrange protocol=tcp
```

### Disable Hyper-V and reboot:
```
dism.exe /Online /Disable-Feature:Microsoft-Hyper-V
```

### Then reserve port 2375:
```
netsh int ipv4 add excludedportrange protocol=tcp startport=2375 numberofports=1
```

### Enable Hyper-V and reboot again:
```
dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All
```
