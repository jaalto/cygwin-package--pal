#!/bin/sh
# Copyright (C) 2008 Jari Aalto; Licensed under GPL v2 or later
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ install-after.sh .inst <caller-prg> <PKG> <VER>
#
# This script is run after [install] command. NOTE: Echo all messages
# with ">> " prefix".

PATH="/sbin:/usr/sbin/:/bin:/usr/bin:/usr/X11R6/bin"
LC_ALL="C"

set -e

Cmd()
{
    echo "$@"
    [ "$test" ] && return
    "$@"
}

Main()
{
    root=${1:-".inst"}
    caller=$2
    pkg=$3
    ver=$4

    if [ ! "$root"  ] || [ ! -d "$root" ]; then
        echo "$0: [ERROR] In $(pwd) no such directory: '$root'" >&2
        return 1
    fi

    root=$(echo $root | sed 's,/$,,')  # Delete trailing slash
    bindir=$root/usr/bin
    sharedir=$root/usr/share
    emacsdir=$sharedir/emacs/site-lisp
    mandir=$sharedir/man/man1

    # .inst/usr/share/doc/pal-0.3.5
    # .inst/usr/share/doc/pal-0.3.5_pre1

    set -- $(find $root -type d -path "*doc/[a-zA-Z]*-*[0-9]*")

    docdir=$1
    docold=$2

    [ "$docold" ] || return 0

    echo ">> Removing old doc directory"
    Cmd rm -rf $docold
}

Main "$@"

# End of file
