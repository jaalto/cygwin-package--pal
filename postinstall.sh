#!/bin/sh
# This is automatically generated file
# Please do not remove section comments '#:<name>'

PATH=/bin:/sbin:/usr/bin:/usr/sbin
LC_ALL=C

#:etc
fromdir=/etc/defaults
for i in   etc etc/pal.conf
do
    src=$fromdir/$i
    dest=/$i

    [ -e $dest ] && continue

    if [ -d $src ] ; then
	install -d -m 755 $dest
	continue
    fi

    install -m 644 $src $dest
done

