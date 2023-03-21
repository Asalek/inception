#stretch superseded buster superseded Bullseye
FROM debian:stretch

# ARG USER=asalek

RUN apt update && \
	apt install mariadb-server -y

COPY ./tools/script.sh /script.sh

RUN chmod +x script.sh

CMD ["bash" , "script.sh"]