## Chick Disk Performance

```
sudo hdparm -Tt /dev/sda
```

## BOM (the first 3 bytes when save UTF-8 text with Notepad under Windows)

```
tail -c +4 TXT
```

check whether a file is having BOM
```
hd -n 3 TXT
```

```
00000000  ef bb bf ...
```
