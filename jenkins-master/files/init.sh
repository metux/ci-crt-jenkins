#!/bin/bash

/etc/init.d/postgresql start
/etc/init.d/postfix start
/etc/init.d/dbus start
#/etc/init.d/firewalld start
/etc/init.d/virtlogd start
/etc/init.d/libvirtd start
/etc/init.d/ssh start

echo "CREATE USER jenkins CREATEDB PASSWORD 'jenkins001'" | su postgres -c psql
echo "CREATE DATABASE jenkins OWNER = jenkins" | su postgres -c psql

exec /usr/local/bin/jenkins.sh

# while true ; do sleep 100 ; done

