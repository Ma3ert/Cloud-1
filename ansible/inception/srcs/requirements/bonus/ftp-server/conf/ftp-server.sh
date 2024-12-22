#!/bin/bash

# creating ftpuser
useradd -m "$FTP_USER"

# setting a password to the user
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

# Create Change permission for the ftp user home folder
mkdir -p /home/"$FTP_USER"/ftp
chown nobody:nogroup /home/"$FTP_USER"/ftp
chmod a-w /home/"$FTP_USER"/ftp

# Create & change the permission for the ftp files directory
mkdir -p /home/"$FTP_USER"/ftp/files
chown "$FTP_USER:$FTP_USER" /home/"$FTP_USER"/ftp/files

# Add user to vsftpd user list
echo "$FTP_USER" >> /etc/vsftpd.userlist

mkdir -p /var/run/vsftpd/empty

exec "$@"