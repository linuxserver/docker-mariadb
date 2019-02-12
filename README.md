[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).

# PSA: Changes are happening

From August 2018 onwards, Linuxserver are in the midst of switching to a new CI platform which will enable us to build and release multiple architectures under a single repo. To this end, existing images for `arm64` and `armhf` builds are being deprecated. They are replaced by a manifest file in each container which automatically pulls the correct image for your architecture. You'll also be able to pull based on a specific architecture tag.

TLDR: Multi-arch support is changing from multiple repos to one repo per container image.

# [linuxserver/mariadb](https://github.com/linuxserver/docker-mariadb)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/mariadb.svg)](https://microbadger.com/images/linuxserver/mariadb "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/mariadb.svg)](https://microbadger.com/images/linuxserver/mariadb "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/mariadb.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/mariadb.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-mariadb/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-mariadb/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/mariadb/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/mariadb/latest/index.html)

[Mariadb](https://mariadb.org/) is one of the most popular database servers. Made by the original developers of MySQL.

[![mariadb](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/mariadb-git.png)](https://mariadb.org/)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list). 

Simply pulling `linuxserver/mariadb` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=mariadb \
  -e PUID=1001 \
  -e PGID=1001 \
  -e MYSQL_ROOT_PASSWORD=<DATABASE PASSWORD> \
  -e TZ=Europe/London \
  -p 3306:3306 \
  -v <path to data>:/config \
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
      - PUID=1001
      - PGID=1001
      - MYSQL_ROOT_PASSWORD=<DATABASE PASSWORD>
      - TZ=Europe/London
    volumes:
      - <path to data>:/config
    ports:
      - 3306:3306
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 3306` | Mariadb listens on this port. |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e MYSQL_ROOT_PASSWORD=<DATABASE PASSWORD>` | Set this to root password for installation (minimum 4 characters). |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-v /config` | Contains the db itself and all assorted settings. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```


&nbsp;
## Application Setup

If you didn't set a password during installation, (see logs for warning) use
`mysqladmin -u root password <PASSWORD>`
to set one at the docker prompt...

NOTE changing the MYSQL_ROOT_PASSWORD variable after the container has set up the initial databases has no effect, use the mysqladmin tool to change your mariadb password.

Unraid users, it is advisable to edit the template/webui after setup and remove reference to this variable.

Find custom.cnf in /config for config changes (restart container for them to take effect)
, the databases in /config/databases and the log in /config/log/myqsl



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
* Update the image: `docker-compose pull linuxserver/mariadb`
* Let compose update containers as necessary: `docker-compose up -d`
* You can also remove the old dangling images: `docker image prune`

## Versions

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
