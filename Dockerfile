#base image : alpine is used for its small size and fast performance
FROM alpine

#alpine package manager
RUN apk add --update redis

#run redis server
CMD [ "redis-server" ]


#SSL : secure sockets layer
#TLS : transport layer security