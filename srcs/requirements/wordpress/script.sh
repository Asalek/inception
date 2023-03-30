#!bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

# To make it available globally on the system, by typing wp command
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/wordpress

wp cli version

cd /var/www/wordpress


#Since the web server needs to make changes to the folder, you must give NGINX the appropriate authorization:

