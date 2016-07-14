#!/bin/bash

for i in $(lsblk -r |awk '{ print $1 }'|grep -v docker | grep -v xvda |grep -v loop |grep .*[[:digit:]]|sort|uniq;);
do
      mkdir /mnt/$i;
      mount -o ro /dev/$i /mnt/$i
      ls /mnt/
done

for f in $(ls /mnt/ |grep -v xvda | grep -i xvd);
do
    echo $f
    echo "Beginning $SNAP"
    mkdir -p /tmp/plaso
    log2timeline.py --workers 2 /tmp/plaso/$SNAP.plaso /mnt/$f;
done
