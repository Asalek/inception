FROM debian:buster

RUN apt update && apt install vsftpd -y

COPY vsftpd.conf vsftpd.conf
COPY script.sh script.sh
RUN chmod +x script.sh

CMD [ "./script.sh" ]