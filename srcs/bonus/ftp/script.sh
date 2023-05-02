#!bin/bash

if [ ! -f "/etc/vsftpd.conf.backup" ]; then

    mkdir -p /var/run/vsftpd/empty
    mkdir -p /var/www/html
    mkdir -p /home/asalek
    cp /etc/vsftpd.conf /etc/vsftpd.conf.backup
    mv /vsftpd.conf /etc/vsftpd.conf

    useradd $ftp_usr
    echo "$ftp_usr:$ftp_pwd" | /usr/sbin/chpasswd
    chown -R $ftp_usr:$ftp_usr /var/www/html
    chown -R $ftp_usr:$ftp_usr /home/asalek

    echo $ftp_usr | tee -a /etc/vsftpd.userlist

fi
/usr/sbin/vsftpd /etc/vsftpd.conf