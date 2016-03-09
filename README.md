![https://linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring auto-update on startup, easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io](https://forum.linuxserver.io)
* [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`
* [Podcast](https://www.linuxserver.io/index.php/category/podcast/) covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/mariadb



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

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 

If you didn't set a password during installation, (see logs for warning) use mysqladmin -u root password <PASSWORD> to set one at the docker prompt... NOTE changing the MYSQL_ROOT_PASSWORD variable after the container has set up the initial databases has no effect. It is also advisable to edit the run command or template/webui after setup and remove reference to this variable.

Find my.cnf in /config, the databases in /config/databases and the log in /config/log/myqsl

The container also has mysqltuner included which can either be run from within the container by exec'ing in or externally by issuing `docker exec -it mariadb mysqltuner`. It will prompt for credentials if you have set a password for root user.



## Logs and Shell

* Shell access whilst the container is running: `docker exec -it mariadb /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f mariadb`



## Versions
+ **09.03.2016:** Change to use custom.cnf over my.cnf in /config. Restructured init files to change config options on startup, rather than in the dockerfile.
+ **26.01.2016:** Change user of mysqld_safe script to abc, better unclean shutdown handling on restart.
+ **23.12.2015:** Remove autoupdating, between some version updates the container breaks
+ **12.08.2015:** Initial Release. 

