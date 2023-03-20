FROM alpine:edge

RUN apk update && \
	apk add mariadb mariadb-client
# FROM debian:latest

# RUN apt-get update && \
# 	apt-get install mariadb-server mariadb-client -y
CMD ls -alR /etc

# docker run -e MARIADB_ROOT_PASSWORD=123 mariadb