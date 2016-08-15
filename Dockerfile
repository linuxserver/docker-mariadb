FROM lsiobase/alpine
MAINTAINER sparklyballs

# environment variables
ENV CONFIG_DIR="/config"
ENV DATADIR="${CONFIG_DIR}"/databases
ENV LOG_DIR="${CONFIG_DIR}"/log/mysql

# install packages
RUN \
 apk add --no-cache \
	mariadb \
	mariadb-client && \

# cleanup
 rm \
	/etc/mysql/my.cnf

# add local files
COPY root/ /

# ports and volumes
VOLUME /config
EXPOSE 3306
