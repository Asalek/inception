FROM debian:buster

RUN apt-get update && apt install nodejs npm -y && \
    npm install -g npm@6.14.15

ADD ./Tindog Tindog

CMD cd Tindog && npm i && npm start