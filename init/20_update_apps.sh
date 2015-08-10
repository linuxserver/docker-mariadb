#!/bin/bash


apt-get update -qq && \
apt-get --only-upgrade install \
mariadb-server -qqy
