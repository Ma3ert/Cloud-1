FROM debian:buster

# Copy the script in the container file system
COPY ./conf/mariaDBScript.sh ./conf/mariaDBScript.sh

# update the apt-get 
RUN apt-get update -y

# install mariadb-server
RUN apt-get -y install mariadb-server && chmod +x ./conf/mariaDBScript.sh

# Run the script in the container
ENTRYPOINT [ "./conf/mariaDBScript.sh" ]

CMD [ "mysqld" ]