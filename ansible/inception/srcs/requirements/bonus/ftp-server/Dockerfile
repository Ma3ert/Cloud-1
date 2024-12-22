FROM debian:buster

COPY ./conf/ftp-server.sh /bin/ftp-server.sh

RUN apt-get update && apt-get install -y vsftpd && chmod +x /bin/ftp-server.sh 

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT [ "/bin/ftp-server.sh" ]

CMD [ "/usr/sbin/vsftpd" ]