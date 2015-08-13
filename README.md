![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](http://linuxserver.io) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](http://forum.linuxserver.io) or for real-time support our [IRC](http://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

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
* `-v </path/to/appdata>:/config` - Where you want to store your databases, log and the my.cnf file. The `</path/to/appdata>` represents a path on your local device, the `/config` is the path inside the container (DO NOT CHANGE CONTAINER SIDE PATH).Find my.cnf in /config, the databases in /config/databases and the log in /config/log/myqsl
* `-e MYSQL_ROOT_PASSWORD=` - Set this to specify a root password for mariadb.. if you do not set this variable or set it with less than 4 characters, then the install will continue with no password set... use mysqladmin -u root password <PASSWORD> to set one at the docker prompt... NOTE changing this variable after the container has set up the initial databases has no effect. It is also advisable to edit the container after setup and remove reference to this variable.
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it mariadb /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Setting up the application 

<Insert a basic user guide here to get a n00b up and running with the software inside the container.> DELETE ME


## Updates

* Upgrade to the latest version simply `docker restart mariadb`.
* To monitor the logs of the container in realtime `docker logs -f mariadb`.



## Versions

+ **12.08.2015:** Initial Release. 
