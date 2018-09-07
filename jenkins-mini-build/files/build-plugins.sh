#!/bin/bash

/build-plugin-libvirt-slave.sh || exit 1
/build-plugin-mailer.sh || exit 1
