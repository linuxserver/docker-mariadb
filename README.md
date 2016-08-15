![https://linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io](https://forum.linuxserver.io)
* [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`
* [Podcast](https://www.linuxserver.io/index.php/category/podcast/) covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/mariadb

![](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/mariadb-git.png)

## Usage

```
docker create \
--name=mariadb \
-p 3306:3306 \
-e PUID=<UID> \
-e PGID=<GID> \
-e MYSQL_ROOT_PASSWORD=<DATABASE PASSWORD> \
-v </path/to/appdata>:/config \
linuxserver/mariadb
```

**Parameters**

* `-p 3306` - mysql port
* `-v /config` - Contains the db itself and all assorted settings. 
* `-e MYSQL_ROOT_PASSWORD` - set this to root password for installation (minimum 4 characters)
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it mariadb /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 

If you didn't set a password during installation, (see logs for warning) use mysqladmin -u root password <PASSWORD> to set one at the docker prompt...
NOTE changing the MYSQL_ROOT_PASSWORD variable after the container has set up the initial databases has no effect, use the mysqladmin to change it. 
Unraid users, it is advisable to edit the template/webui after setup and remove reference to this variable.

Find custom.cnf in /config for config changes (restart container for them to take effect)
, the databases in /config/databases and the log in /config/log/myqsl

## Info

* Shell access whilst the container is running: `docker exec -it mariadb /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f mariadb`

## Versions
+ **15.08.16:** Rebase to alpine linux.
+ **09.03.16:** Update to mariadb 10.1. Change to use custom.cnf over my.cnf in /config. Restructured init files to change config options on startup, rather than in the dockerfile.
+ **26.01.16:** Change user of mysqld_safe script to abc, better unclean shutdown handling on restart.
+ **23.12.15:** Remove autoupdating, between some version updates the container breaks
+ **12.08.15:** Initial Release. 


