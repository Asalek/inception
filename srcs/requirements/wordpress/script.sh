#!/bin/bash

cd /var/www/wordpress

mv wp-config-sample.php wp-config.php

chmod 777 wp-config.php

sed -i "s/database_name_here/$asalekDb/1" wp-config.php
sed -i "s/password_here/$db_passwd/1" wp-config.php
sed -i "s/username_here/$db_user/1" wp-config.php
sed -i "s/localhost/mariadb/1" wp-config.php