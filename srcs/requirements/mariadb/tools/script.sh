#!/bin/bash

sed -i "s/bind-address.*/bind-address=${$ip_all}/" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/port.*/port=${$maria_port}/" /etc/mysql/mariadb.conf.d/50-server.cnf

#-i :  modify the file in place
#s/MY_VARIABLE=.*/MY_VARIABLE=${new_value}/     : matches any line in the file that starts with MY_VARIABLE= and replaces the entire line with MY_VARIABLE=new_value.

service mysql start
sleep 5;

touch db

echo "CREATE DATABASE $db_name;" >> db
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_passwd';" >> db
echo "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_passwd';" >> db
echo "GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%';" >> db
echo "FLUSH PRIVILEGES;" >> db
echo "EXIT;" >> db


kill $(cat /var/run/mysqld/mysqld.pid)
#The reason why you need to kill the MySQL PID before running mysqld_safe
#is that mysqld_safe is a script that starts the MySQL server in the foreground
# and monitors it for errors. If the server encounters an error or crashes,
#mysqld_safe will attempt to restart it automatically.
#if there is already a running instance of the MySQL server (as indicated by the PID file),
#running mysqld_safe will likely fail, because it cannot start a new instance of the server while there is already one running.
sleep 5;
#The *.* wildcard notation implies that the user has permission to execute any task on any database in the database server.

/usr/bin/mysqld_safe