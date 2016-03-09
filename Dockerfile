# set base os
FROM linuxserver/baseimage

MAINTAINER Sparklyballs  <sparklyballs@linuxserver.io>

# set some environment variables for mariadb to give us our paths
ENV INSTALL_LIST="mariadb-server mysqltuner"
ENV MYSQL_DIR="/config"
ENV DATADIR=$MYSQL_DIR/databases

# set the repo version for mariadb choose between 5.5 or 10.0
ENV REPO_VER 10.0

# update apt and install packages
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
add-apt-repository "deb http://mirrors.coreix.net/mariadb/repo/$REPO_VER/ubuntu trusty main" && \
apt-get update && \
apt-get install \
$INSTALL_LIST -qy && \

# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/lib/mysql && \
mkdir -p /var/lib/mysql

#Adding Custom files
COPY init/ /etc/my_init.d/
COPY services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# set volumes and ports
VOLUME /config
EXPOSE 3306


