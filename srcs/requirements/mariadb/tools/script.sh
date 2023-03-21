#!/bin/bash

service mysql start

# mysql -u root -e "CREATE USER '${db_user}'@'%' IDENTIFIED BY '${db_passwd}';"

touch db

echo "CREATE DATABASE $db_name;" >> db
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_passwd';" >> db
echo "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_passwd';" >> db
echo "GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%';" >> db
echo "FLUSH PRIVILEGES;" >> db

# mysql -u root -e "alter user 'root'@'localhost' identified by '${WORDPRESS_ROOT_PASSWORD}';"

mysql < db
# SHOW DATABASES;

#The *.* wildcard notation implies that the user has permission to execute any task on any database in the database server.