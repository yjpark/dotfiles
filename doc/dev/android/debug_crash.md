libunity.so can be found in `/Applications/Unity/PlaybackEngines/AndroidPlayer/Variations`

```
arm-linux-androideabi-objdump -d libunity.so > libunity.txt
```

```
arm-linux-androideabi-addr2line -C -f -e 
```

http://stackoverflow.com/questions/5314036/how-to-use-addr2line-in-android
