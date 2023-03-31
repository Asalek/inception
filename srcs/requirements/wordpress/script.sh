#!bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

# To make it available globally on the system, by typing wp command
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/wordpress

cd /var/www/wordpress

wp core download --allow-root

mv wp-config-sample.php wp-config.php

sed -i "s/define( 'DB_USER'*/define( 'DB_NAME', '${db_name}' );" /var/www/wordpress/wp-config.php
