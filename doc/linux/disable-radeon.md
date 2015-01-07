In Ubuntu 14.04, can't unload radeon after it's loaded, need to add this to `/etc/default/grup`, then run `update-grub`

GRUB_CMDLINE_LINUX_DEFAULT="radeon.runpm=0 radeon.modeset=0 rd.blacklist=radeon rd.driver.blacklist=radeon"
