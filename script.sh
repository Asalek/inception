#!/bin/bash

su root

echo "asalek.42.fr 127.0.0.1" >> /etc/hosts
apt update
apt-get install make ftp docker-compose vim ssh git -y
apt install docker.io -y
apt install docker -y
systemctl enable docker --now