

mcrypt
```
sudo apt-get install php5-mcrypt
```

- http://pyd.io/f/topic/problems-to-install-ajaxplorer/
- http://askubuntu.com/questions/360646/cant-use-php-extension-mcrypt-in-ubuntu-13-10-nginx-php-fpm
```
sudo ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/apache2/conf.d/20-mcyrpt.ini
```

readonly folder
- http://pyd.io/f/topic/map-read-only-file-system-repository/
```
Modify /usr/share/ajaxplorer/plugins/access.fs/test.fsAccess.php so that read-only filesystems can be used:

Change the line:
// { $this->failedInfo .= « Selected repository path « .$path. » isn’t writeable »; return FALSE; }
To:
{ $this->failedInfo .= « Selected repository path « .$path. » isn’t writeable »; return TRUE; }
```
