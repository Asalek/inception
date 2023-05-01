FROM debian:buster

RUN apt update && apt install wget php php-mysql -y && \
    wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php && \
    chmod 777 /var/www/html/adminer.php && \ 
    rm /var/www/html/index.html || rm /var/www/html/index.htm

CMD php -S 0.0.0.0:1025 /var/www/html/adminer.php