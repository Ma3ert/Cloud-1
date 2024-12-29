#!/bin/sh

# start mysql (mariadb)
	/etc/init.d/mysql start
	sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
# create database
	mysql -u root -p$ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
# give the user the privlege on the database created and set a password for the user
	mysql -u root -p$ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$DATABASE_USER'@'%' IDENTIFIED BY '$USER_PASSWORD';"
	mysql -u root -p$ROOT_PASSWORD -e "GRANT ALL ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%';"
# Apply changes
	mysql -u root -p$ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
# set a password for the root
	mysql -u root -p$ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
	kill `cat /var/run/mysqld/mysqld.pid`
exec "$@"