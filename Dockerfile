FROM ghcr.io/linuxserver/baseimage-alpine:3.12

# set version label
ARG BUILD_DATE
ARG VERSION
ARG MARIADB_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer,nemchik"

# environment variables
ENV MYSQL_DIR="/config"
ENV DATADIR=$MYSQL_DIR/databases

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	gnupg \
	mariadb \
	mariadb-client \
	mariadb-common && \
 echo "**** cleanup ****" && \
 rm -rf \
    /root/.cache \
    /tmp/* && \
 mkdir -p \
	/var/lib/mysql

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 3306
VOLUME /config
