## Disable local time machine backups
- http://wiki.summercode.com/how_to_disable_mobile_backups_on_lion
```
sudo tmutil disablelocal
```

## Change default shell ##
- http://stackoverflow.com/questions/453236/how-can-i-set-fish-shell-as-my-default-shell-on-mac

- Add `/usr/local/bin/fish` to `/etc/shells`
- chsh -s /usr/local/bin/fish
