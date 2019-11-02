[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?style=flat-square&color=E68523&label=Discord&logo=discord&logoColor=FFFFFF)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?style=flat-square&color=E68523&logo=discourse&logoColor=FFFFFF)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![GitHub](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitHub&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Podcast](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Podcast)](https://anchor.fm/linuxserverio "on hiatus. Coming back soon (late 2018).")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?style=flat-square&color=E68523&label=Supporters&logo=open%20collective&logoColor=FFFFFF)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/mariadb](https://github.com/linuxserver/docker-mariadb)

[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-mariadb.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-mariadb)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-mariadb.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-mariadb/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitHub%20Package&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-mariadb/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab&logoColor=FFFFFF)](https://gitlab.com/Linuxserver.io/docker-mariadb/container_registry)
[![Quay.io](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Quay.io)](https://quay.io/repository/linuxserver.io/mariadb)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/linuxserver/mariadb.svg?style=flat-square&color=E68523)](https://microbadger.com/images/linuxserver/mariadb "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/mariadb.svg?style=flat-square&color=E68523&label=pulls&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/linuxserver/mariadb)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/mariadb.svg?style=flat-square&color=E68523&label=stars&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/linuxserver/mariadb)
[![Build Status](https://ci.linuxserver.io/view/all/job/Docker-Pipeline-Builders/job/docker-mariadb/job/master/badge/icon?style=flat-square)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-mariadb/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/mariadb/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/mariadb/latest/index.html)

[Mariadb](https://mariadb.org/) is one of the most popular database servers. Made by the original developers of MySQL.

[![mariadb](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/mariadb-git.png)](https://mariadb.org/)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `linuxserver/mariadb` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=mariadb \
  -e PUID=1000 \
  -e PGID=1000 \
  -e MYSQL_ROOT_PASSWORD=ROOT_ACCESS_PASSWORD \
  -e TZ=Europe/London \
  -e MYSQL_DATABASE=USER_DB_NAME `#optional` \
  -e MYSQL_USER=MYSQL_USER `#optional` \
  -e MYSQL_PASSWORD=DATABASE_PASSWORD `#optional` \
  -e REMOTE_SQL=http://URL1/your.sql,https://URL2/your.sql `#optional` \
  -p 3306:3306 \
  -v path_to_data:/config \
  --restart unless-stopped \
  linuxserver/mariadb
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  mariadb:
    image: linuxserver/mariadb
    container_name: mariadb
    environment:
      - PUID=1000
      - PGID=1000
      - MYSQL_ROOT_PASSWORD=ROOT_ACCESS_PASSWORD
      - TZ=Europe/London
      - MYSQL_DATABASE=USER_DB_NAME #optional
      - MYSQL_USER=MYSQL_USER #optional
      - MYSQL_PASSWORD=DATABASE_PASSWORD #optional
      - REMOTE_SQL=http://URL1/your.sql,https://URL2/your.sql #optional
    volumes:
      - path_to_data:/config
    ports:
      - 3306:3306
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 3306` | Mariadb listens on this port. |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e MYSQL_ROOT_PASSWORD=ROOT_ACCESS_PASSWORD` | Set this to root password for installation (minimum 4 characters). |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-e MYSQL_DATABASE=USER_DB_NAME` | Specify the name of a database to be created on image startup. |
| `-e MYSQL_USER=MYSQL_USER` | This user will have superuser access to the database specified by MYSQL_DATABASE (do not use root here). |
| `-e MYSQL_PASSWORD=DATABASE_PASSWORD` | Set this to the password you want to use for you MYSQL_USER (minimum 4 characters). |
| `-e REMOTE_SQL=http://URL1/your.sql,https://URL2/your.sql` | Set this to ingest sql files from an http/https endpoint (comma seperated array). |
| `-v /config` | Contains the db itself and all assorted settings. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```


&nbsp;
## Application Setup

If you didn't set a password during installation, (see logs for warning) use
`mysqladmin -u root password <PASSWORD>`
to set one at the docker prompt...

NOTE changing the MYSQL_ROOT_PASSWORD variable after the container has set up the initial databases has no effect, use the mysqladmin tool to change your mariadb password.

NOTE if you want to use (MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD) **all three** of these variables need to be set you cannot pick and choose.

Unraid users, it is advisable to edit the template/webui after setup and remove reference to this variable.

Find custom.cnf in /config for config changes (restart container for them to take effect)
, the databases in /config/databases and the log in /config/log/myqsl

### Loading passwords and users from files

The `MYSQL_ROOT_PASSWORD MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD REMOTE_SQL` env values can be set in a file: 

```
/config/env
```

Using the following format: 

```
MYSQL_ROOT_PASSWORD="ROOT_ACCESS_PASSWORD"
MYSQL_DATABASE="USER_DB_NAME"
MYSQL_USER="MYSQL_USER"
MYSQL_PASSWORD="DATABASE_PASSWORD"
REMOTE_SQL="http://URL1/your.sql,https://URL2/your.sql"
```

These settings can be mixed and matched with Docker ENV settings as you require, but the settings in the file will always take precedence.

### Bootstrapping a new instance

We support a one time run of custom sql files on init. In order to use this place `*.sql` files in:

```
/config/initdb.d/
```
This will have the same effect as setting the `REMOTE_SQL` environment variable. The sql will only be run on the containers first boot and setup.



## Support Info

* Shell access whilst the container is running: `docker exec -it mariadb /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f mariadb`
* container version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' mariadb`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/mariadb`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Run/Create
* Update the image: `docker pull linuxserver/mariadb`
* Stop the running container: `docker stop mariadb`
* Delete the container: `docker rm mariadb`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start mariadb`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull mariadb`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d mariadb`
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one run:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once mariadb
  ```

**Note:** We do not endorse the use of Watchtower as a solution to automated updates of existing Docker containers. In fact we generally discourage automated updates. However, this is a useful tool for one-time manual updates of containers where you have forgotten the original parameters. In the long term, we highly recommend using Docker Compose.

* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/linuxserver/docker-mariadb.git
cd docker-mariadb
docker build \
  --no-cache \
  --pull \
  -t linuxserver/mariadb:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **27.10.19:** - Bump to 10.4, ability use custom sql on initial init ,defining root passwords via file.
* **23.03.19:** - Switching to new Base images, shift to arm32v7 tag.
* **07.03.19:** - Add ability to setup a database and default user on first spinup.
* **26.01.19:** - Add pipeline logic and multi arch.
* **10.09.18:** - Rebase to ubuntu bionic and use 10.3 mariadb repository.
* **09.12.17:** - Fix continuation lines.
* **12.09.17:** - Gracefully shut down mariadb.
* **27.10.16:** - Implement linting suggestions on database init script.
* **11.10.16:** - Rebase to ubuntu xenial, add version labelling.
* **09.03.16:** - Update to mariadb 10.1. Change to use custom.cnf over my.cnf in /config. Restructured init files to change config options on startup, rather than in the dockerfile.
* **26.01.16:** - Change user of mysqld_safe script to abc, better unclean shutdown handling on restart.
* **23.12.15:** - Remove autoupdating, between some version updates the container breaks.
* **12.08.15:** - Initial Release.
