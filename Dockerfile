#base image : alpine is used for its small size and fast performance
FROM alpine

#alpine package manager
RUN apk add nginx && \
	apk add openssl
RUN openssl req -x509 -nodes -days 365	-newkey rsa:2048 \
	-keyout /etc/ssl/private/asalek-prv.key \ 
	-out /etc/ssl/certs/asalek-cer.crt \
	-subj "/CN=asalek.42.fr"
# openssl	: creating and managing OpenSSL certificates, keys, and other files.
# req		: request a certificate 
# x509		: self-signed certificate will be created, certificate signing request (CSR)
# nodes		: skip securing the certificate with a passphrase, so nginx could read the file
# newkey	: generate a new certificate and a new key at the same time
# rsa:2048	: RSA key with 2048 Bit
# subj		: define the subject of certificate with Common Name (*)

# EXPOSE 443
CMD [ "/usr/sbin/nginx"]


#SSL : secure sockets layer
#TLS : transport layer security