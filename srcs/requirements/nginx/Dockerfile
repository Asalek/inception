#base image : alpine is used for its small size and fast performance
FROM debian:stretch

#alpine package manager
RUN apt-get update -y && apt upgrade -y && \
	apt-get install nginx -y && \
	apt-get install openssl -y && \
	openssl req -x509 -nodes -days 365	-newkey rsa:2048 \
	-keyout /etc/ssl/private/asalek-prv.key \ 
	-out /etc/ssl/certs/asalek-cer.crt \
	-subj "/CN=asalek.42.fr"

COPY ./x.conf /etc/nginx/sites-available/default

# openssl	: creating and managing OpenSSL certificates, keys, and other files.
# req		: request a certificate 
# x509		: self-signed certificate will be created, certificate signing request (CSR)
# nodes		: skip securing the certificate with a passphrase, so nginx could read the file
# newkey	: generate a new certificate and a new key at the same time
# rsa:2048	: RSA key with 2048 Bit
# subj		: define the subject of certificate with Common Name (*)

# EXPOSE 443
CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]


#SSL : secure sockets layer
#TLS : transport layer security

#docker run -p 443:443 --name ngin ngin
