#stretch superseded buster superseded Bullseye
FROM debian:buster

# ARG USER=asalek

RUN apt update && \
	apt install mariadb-server -y

RUN sed -i "s/bind-address.*/bind-address            = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i "s/#port.*/port                    = 3306/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /script.sh

RUN chmod +x script.sh

CMD ["bash" , "script.sh"]