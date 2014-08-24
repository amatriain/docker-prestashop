# Docker Prestashop image

## About

Based on the [tutum/lamp](https://registry.hub.docker.com/u/tutum/lamp/) docker image, with prestashop-specific additions. The image has Mysql, Apache and PHP installed with all modules and configuration required by Prestashop. The only site enabled in Apache is the Prestashop installation.

Dockerfile and other files can be found at the github repo: [amatriain/docker-prestashop](https://github.com/amatriain/docker-prestashop). 

Docker image can be found at the docker-hub repo: [amatriain/prestashop](https://registry.hub.docker.com/u/amatriain/prestashop/). This is not an automated docker-hub build, because automated builds are always tagged as "latest"; this would keep this image from being tagged with the prestashop version.

Tagging both in Github and Docker-hub follows the Prestashop version: i.e. version 1.6.0.9 of this image contains Prestashop 1.6.0.9

## Using

See [Docker docs](http://docs.docker.com/reference/run) about running a container from an image.

After starting the container, access port 80 with a browser to run the Prestashop installation wizard.

A database named **prestashop** is already created. There are three database users: 

 - **root**: can only login from localhost, no password necessary
 - **admin**: can login from any host, default password **admin**. A different password can be specified by setting the `MYSQL_ADMIN_PASS` env variable to the first run of the container, or it can be changed afterwards with a mysql client
 - **prestashop**: can login from any host, default password **prestashop**. It only has access to the "prestashop" database. A different password can be specified by setting the `MYSQL_PRESTASHOP_PASS` env variable to the first run of the container,  or it can be changed afterwards with a mysql client

Be aware that the default database passwords should be changed if you use this image in production.

## Exposed ports

80 (http), 3306 (mysql). HTTPS is not enabled in this image.

## Exposed volumes

 - mysql configuration: `/etc/mysql`
 - mysql data: `/var/lib/mysql`
 - apache logs: `/var/log/apache2`
 - prestashop installation: `/var/www/html`
 
## Inspecting and editing a running container logs and Prestashop files

You can create a [data volume container](http://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container) from this image, and afterwards start a container for the Prestashop app with the `--volumes-from` option so that volumes are shared (the data volume container can be stopped, it is only required that it exists). This way an interactive container can be started with the `--volumes-from` option and `/bin/bash` as a command to examine the logs, php files etc of the running Prestashop app.

## Important: Bug in Prestashop 1.6.0.9

Be aware that Prestashop 1.6.0.9 is affected by [this bug](http://www.prestashop.com/forums/topic/352768-fatal-error/), which you will likely want to fix by hand after starting the container. To make the necessary php file modification you can follow the procedure described above under **Inspecting and editing a running container logs and Prestashop files**.

## Licensing

Licensed under the [Open Software License (OSL) v3.0](http://www.prestashop.com/en/osl-license) for compliance with the Prestashop license.

For more details see LICENSE.txt file in this folder.

## About Prestashop

[Prestashop](http://www.prestashop.com) is an ecommerce application licensed under the OSL v3.0 license. ©PrestaShop, Inc.

## About Docker

[Docker](http://www.docker.com/) is an open platform that automates the deployment of applications inside software containers, providing that way an additional layer of abstraction and automatization of operating system–level virtualization on Linux. Docker uses resource isolation features of the Linux kernel such as cgroups and kernel namespaces to allow independent "containers" to run within a single Linux instance, avoiding the overhead of starting virtual machines.

Licensed under the Apache 2.0 license.
