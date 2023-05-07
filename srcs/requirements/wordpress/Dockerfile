FROM debian:buster

RUN apt-get update && apt-get install \
	php-fpm php-mysql curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/html && cd /var/www/html && \
	wp core download --allow-root

COPY ./script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh" ]
