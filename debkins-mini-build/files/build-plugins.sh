#!/bin/bash

rm -Rf /work/build
# /build-plugin-libvirt-slave.sh || exit 1
# /build-plugin-mailer.sh || exit 1
/build-plugin-aptly-publisher.sh || exit 1
