#!/bin/bash

if [ ! -d "/config/log/myqsl" ]; then
mkdir -p /config/log/mysql
fi


if [ ! -d "$DATADIR" ]; then
mkdir -p $DATADIR
fi

if [ ! -d "/var/run/mysqld" ]; then
mkdir -p /var/run/mysqld
chmod -R 777 /var/run/mysqld
fi
