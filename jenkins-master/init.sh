#!/bin/bash

/etc/init.d/postgresql start
/etc/init.d/nullmailer start

echo "CREATE USER jenkins CREATEDB PASSWORD 'jenkins001'" | su postgres -c psql
echo "CREATE DATABASE jenkins OWNER = jenkins" | su postgres -c psql

exec /usr/local/bin/jenkins.sh
