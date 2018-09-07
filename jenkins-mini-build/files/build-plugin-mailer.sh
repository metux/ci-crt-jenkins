#!/bin/bash

REPO=https://github.com/metux/mailer-plugin.git
SRCDIR=/work/build/mailer-plugin

mkdir -p /work/build /work/plugins

git clone $REPO $SRCDIR || exit 1

(cd $SRCDIR && mvn package) || exit 2

cp $SRCDIR/target/mailer.hpi /work/plugins || exit 3
