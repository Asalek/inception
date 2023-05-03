all:
	docker-compose -f srcs/docker-compose.yml up --build
stop:
	docker-compose -f srcs/docker-compose.yml down --rmi all
prune:
	docker system prune -f
hosts:
	echo "asalek.42.fr 127.0.0.1" >> /etc/hosts 