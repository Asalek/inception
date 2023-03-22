## YAML :
	(YAML Ain't Markup Language) is a human readable data serialization format, it's often used for configuration files and data exchange between programming languages as it's more readable and maintainable than other data serialization formats, sch as JSON, XML. as it supported by many programming languages, tools (Docker, Kubernetes, ...) and frameworks.


## Alpine or Debian :
	Alpine is designed to be a lightweight distribution with a small footprint. it uses the musl C library. Musl is designed to be lightweight and fast which makes Alpine a good choice for running containerized applications or other situations where small size and speed are important. its default package manager is apk.
	Debian is known for its stability and reliability it uses the common glibc(short for GNU C library) library with a large number of packages, and its default package manager is apt.

## NGINX :
	NGINX is a Web Server that handle HTTP requests and distribute traffic across multiple servers. High performance, reliable and scalable. its provides also many features such as SSL/TLS encryption, URL rewriting, ...

## Daemon :
	The docker daemon listens for docker api requests and manages Docker object such as images, containers, networks, and volumes.

## NameSpaces :
	Docker uses namespaces to provide a level of isolation between containers and the host system. Namespaces are a feature of the Linux kernel that allow for multiple independent instances of a global resource to exist, each with its own isolated view of the system

- The different namespaces used by Docker are as follows:

1_PID namespace: This namespace isolates process IDs. Each container has its own PID namespace, which means that the processes running inside a container can only see and interact with other processes in the same namespace.

2_Network namespace: This namespace isolates network interfaces. Each container has its own network namespace, which means that it has its own isolated view of the network stack, with its own network devices, IP addresses, routing tables, and so on.

3_Mount namespace: This namespace isolates the file system. Each container has its own mount namespace, which means that it has its own isolated view of the file system, with its own root directory, mounted file systems, and so on.

4_IPC namespace: This namespace isolates inter-process communication mechanisms, such as message queues and shared memory. Each container has its own IPC namespace, which means that it has its own isolated view of these communication mechanisms.

5_UTS namespace: This namespace isolates the hostname and domain name. Each container has its own UTS namespace, which means that it has its own isolated view of the system's hostname and domain name.

6_User namespace: This namespace isolates user and group IDs. Each container has its own user namespace, which means that it has its own isolated view of the system's user and group IDs.

By isolating these different aspects of the system, Docker can provide a high level of containerization and security. Each container is essentially running in its own isolated environment, with its own view of the system's resources. This allows Docker to provide a flexible and powerful platform for running containerized applications, while still maintaining a high level of isolation and security.

## SSL / TLS :
	<strong>SSL</strong> (Secure Sockets Layer) is a security protocol that provides secure communication over the internet. It was developed to provide a secure connection between a client and a server, ensuring that sensitive information such as passwords, credit card numbers, and other personal data can be transmitted securely
	<strong>TLS</strong> (Transport Layer Security) is a cryptographic protocol that provides secure communication over the internet. It is the successor to SSL (Secure Sockets Layer) and is used to provide a secure connection between a client and a server.
## PHP-FPM :
	PHP-FPM stands for PHP FastCGI Process Manager, It is a PHP extension that allows PHP to run as a FastCGI process and manage the processes dynamically, handling requests for PHP scripts from a web server.
	When PHP is run as a FastCGI process, it is separated from the web server and can run as a standalone process, enabling better performance and resource usage. It also provides a number of features, such as process management, process priority, and logging.
## FAstCGI :
	FastCGI (Fast Common Gateway Interface) is a protocol that allows a web server to interface with a standalone application or script that handles HTTP requests.

## Docker for Linux

```
    sudo apt update
    sudo apt install docker.io -y
    sudo apt install docker -y
    sudo systemctl enable docker --now
	sudo systemctl status docker
    docker --version
```

## Docker Useful CMDs :
	docker pull <img_name>					: pull a container, by default will oull it from docker-hub
	docker run <img_name>					: pull and run if img not found, run if founded
	docker container ls -a 					: show all containers
	docker images
	docker container run -d <img_name>		: run container in background
	docker inspect <img_name>				: informations about an image
	docker info								: infos about containers, images, CPU usages, memory, ...
	docker inspect --format='{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id> : gives container ip address
	docker container stop <name_or_containerName> : stop a running container

					//	-d in back, -p run on port 80 give container n1 name`
	docker container run --detach --publish 80:80 --name n1 nginx
	docker exec -it <container_name> bash	: run bash in a running container
	docker history <container_name>			: show container layers (commands)
	docker tag <container_name> <account_name/tag_name>	: give your container a tag nam (docker tag redis asalek/redis:dev) if dev removed latest is default
	docker rm <container_id>				: delete a container
	docker image rm <img_name or img_id>	: delete an image
	docker rm $(docker ps -aq)				: delete all containers
	docker rmi -f $(docker images -aq)		: delete all images
	docker build --tag <tag_name> .			: build an image with tag
	docker exec -it <container_name> bash	: run a container and return bash as CLI
	docker system prune -a					: delete all containers and images
	docker volume ls						: list all valume on the machine
	docker run -v marivm:/var/lib/mysql mariadb: create/bind a volume for mariadb
	docker volume create maria-vol			: create new volume
	docker-compose down --rmi all			: clear docker-compose cache

	docker cp <id>:/irc_server .			: copy a file from container to .