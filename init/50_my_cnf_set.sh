#!/bin/bash

if [ ! -f "$MYSQL_DIR/my.cnf" ];then
cp /defaults/my.cnf "$MYSQL_DIR"/my.cnf
chown abc:abc "$MYSQL_DIR"/my.cnf
chmod 666 "$MYSQL_DIR"/my.cnf
fi

cp "$MYSQL_DIR"/my.cnf /etc/mysql/my.cnf
