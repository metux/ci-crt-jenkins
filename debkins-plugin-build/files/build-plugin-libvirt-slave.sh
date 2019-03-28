#!/bin/bash

REPO=https://github.com/metux/libvirt-slave-plugin.git
SRCDIR=/work/build/libvirt-slave-plugin

mkdir -p /work/build /work/plugins

git clone $REPO $SRCDIR || exit 1

(cd $SRCDIR && mvn package) || exit 2

cp $SRCDIR/target/libvirt-slave.hpi /work/plugins || exit 3
