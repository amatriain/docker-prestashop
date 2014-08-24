#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"  
    /create_db.sh prestashop
    /create_mysql_admin_user.sh
    /create_mysql_prestashop_user.sh
else
    echo "=> Using an existing volume of MySQL"
fi

exec supervisord -n
