# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.17

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
  if [ -z ${MARIADB_VERSION+x} ]; then \
    MARIADB_VERSION=$(curl -sL "http://dl-cdn.alpinelinux.org/alpine/v3.17/main/x86_64/APKINDEX.tar.gz" | tar -xz -C /tmp \
    && awk '/^P:mariadb$/,/V:/' /tmp/APKINDEX | sed -n 2p | sed 's/^V://'); \
  fi && \
  apk add --no-cache \
    gnupg \
    mariadb==${MARIADB_VERSION} \
    mariadb-backup==${MARIADB_VERSION} \
    mariadb-client==${MARIADB_VERSION} \
    mariadb-common==${MARIADB_VERSION} \
    mariadb-server-utils==${MARIADB_VERSION} && \
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
