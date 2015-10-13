# set base os
FROM linuxserver/baseimage

MAINTAINER Sparklyballs  <sparklyballs@linuxserver.io>

# set some environment variables for mariadb to give us our paths
ENV APTLIST="mariadb-server mysqltuner"
ENV MYSQL_DIR="/config"
ENV DATADIR=$MYSQL_DIR/databases

# set the repo version for mariadb choose between 5.5 or 10.0
ENV REPO_VER 10.0

# update apt and install packages
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
add-apt-repository "deb http://mirrors.coreix.net/mariadb/repo/$REPO_VER/ubuntu trusty main" && \
apt-get update && \
apt-get install \
$APTLIST -qy && \

# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/lib/mysql && \
mkdir -p /var/lib/mysql

# Tweak my.cnf
RUN sed -ri 's/^(bind-address|skip-networking)/;\1/' /etc/mysql/my.cnf && \
sed -i s#/var/log/mysql#/config/log/mysql#g /etc/mysql/my.cnf && \
sed -i -e 's/\(user.*=\).*/\1 abc/g' /etc/mysql/my.cnf && \
sed -i -e "s#\(datadir.*=\).*#\1 $DATADIR#g" /etc/mysql/my.cnf && \
cp /etc/mysql/my.cnf /defaults/my.cnf

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# set volumes and ports
VOLUME /config
EXPOSE 3306

