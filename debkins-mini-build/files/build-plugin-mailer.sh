#!/bin/bash

REPO=https://github.com/metux/mailer-plugin.git
SRCDIR=/work/build/mailer-plugin

mkdir -p /work/build /work/plugins

echo "Cloning repo ..."
git clone $REPO $SRCDIR || exit 1

echo "building plugin-mailer"
(cd $SRCDIR && mvn package) || exit 2

echo "Copying plugin-mailer"
cp $SRCDIR/target/mailer.hpi /work/plugins || exit 3
ls -la /work/plugins

echo "Done"
