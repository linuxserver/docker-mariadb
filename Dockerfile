FROM lsiobase/xenial

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# environment variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV MYSQL_DIR="/config"
ENV DATADIR=$MYSQL_DIR/databases

RUN \
 echo "**** add mariadb repository ****" && \
  apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 && \
 echo "deb [arch=amd64,i386] http://mirrors.coreix.net/mariadb/repo/10.1/ubuntu xenial main" >> /etc/apt/sources.list.d/mariadb.list && \
 echo "deb-src http://mirrors.coreix.net/mariadb/repo/10.1/ubuntu xenial main" >> /etc/apt/sources.list.d/mariadb.list && \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
	mariadb-server && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/lib/mysql \
	/var/tmp/* && \
 mkdir -p \
	/var/lib/mysql

# add local files
COPY root/ /

# ports and volumes
EXPOSE 3306
VOLUME /config
