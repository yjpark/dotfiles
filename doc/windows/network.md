- https://support.purevpn.com/how-to-change-mtu-value-on-windows-xp-vista-7-and-8

### Show MTU
```
netsh interface ipv4 show subinterfaces
```

### Set MTU
```
netsh interface ipv4 set subinterface PureVPN mtu=1498 store=persistent
```
