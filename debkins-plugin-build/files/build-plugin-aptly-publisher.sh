#!/bin/bash

REPO=https://github.com/oss-qm/aptly-publisher-plugin.git
SRCDIR=/work/build/aptly-publisher-plugin

mkdir -p /work/build /work/plugins

git clone $REPO $SRCDIR || exit 1

(cd $SRCDIR && gradle jpi) || exit 2

cp $SRCDIR/build/libs/aptly-publisher.hpi /work/plugins || exit 3
