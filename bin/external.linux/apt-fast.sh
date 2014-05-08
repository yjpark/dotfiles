#!/bin/sh
# apt-fast v0.02 by Matt Parnell http://www.mattparnell.com, this thing is fully open-source
# if you do anything cool with it, let me know so I can publish or host it for you
# contact me at admin@mattparnell.com

# Special thanks to Travis/travisn000 from the PCLinux Forums for making improvements that allow
# for more complex apt-get commands. See the thread: http://www.pclinuxos.com/forum/index.php/topic,66385.0.html

# Use this just like apt-get for faster package downloading. Make sure to have axel installed.

# If the user entered arguments contain upgrade, install, or dist-upgrade
if echo "$@" | grep -q "upgrade\|install\|dist-upgrade\|build-dep"; then
  echo -e "apt-fast.sh Working...\n";

  # Go into the directory apt-get normally puts downloaded packages
  cd /var/cache/apt/archives/;

  # Have apt-get print the information, including the URI's to the packages
  # Strip out the URI's, and download the packages with Axel for speediness
  # I found this regex elsewhere, showing how to manually strip package URI's you may need...thanks to whoever wrote it
  apt-get --print-uris $@ | tee apt-fast.list && cat apt-fast.list | egrep -o -e "(ht|f)tp://[^\']+" | xargs -r -L1 axel -a && apt-get $@;

  echo -e "\napt-fast.sh Done! Verify that all packages were installed successfully. If errors are found, run apt-get clean as root and try again using apt-get directly.\n";

else
   apt-get $@;
fi

