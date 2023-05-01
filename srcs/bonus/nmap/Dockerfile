FROM debian:buster

RUN apt update && apt install nmap -y && mkdir scan_result

COPY ./n_script.sh n_script.sh

RUN chmod 777 n_script.sh

CMD bash n_script.sh