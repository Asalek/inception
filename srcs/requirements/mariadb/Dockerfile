#stretch superseded buster superseded Bullseye
FROM debian:buster

ARG db_name=asalekDb
ARG db_root_passwd=1234
ARG db_passwd=1234
ARG db_user=asalek

RUN apt update && \
	apt install mariadb-server mariadb-client -y

COPY ./tools/script.sh /script.sh

RUN chmod +x script.sh && ./script.sh

# CMD ls /etc/mysql/mariadb.conf.d
CMD /usr/bin/mysqld_safe

# docker run -e MARIADB_ROOT_PASSWORD=123 mariadb