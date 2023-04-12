#!/bin/bash
export name=$(ls /etc/php/)

cd /var/www/html

mv wp-config-sample.php wp-config.php > /dev/null

chmod 777 wp-config.php

sed -i "s/database_name_here/$db_name/1" wp-config.php
sed -i "s/password_here/$db_passwd/1" wp-config.php
sed -i "s/username_here/$db_user/1" wp-config.php
# sed -i "s/localhost/mariadb/1" wp-config.php

# wp user create $wp_admin $wp_admin_email user_pass=$wp_admin_psswd --role=administrator --porcelain
wp user create $wp_user $wp_email --role=author --user_pass=$wp_psswd --allow-root

sed -i "s/listen = \/run\/php\/php$name-fpm.sock/listen = 9000/1" /etc/php/$name/fpm/pool.d/www.conf

# the /run/php used by PHP-FPM to store process Id.
mkdir -p /run/php


# exec destroyed The current shell process , and entirely replace it by the command php-fpm
exec php-fpm$name -F