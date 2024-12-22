FROM debian:buster

COPY ./conf/wordpress.sh /bin/wordpress.sh

# Update apt-get
RUN apt-get update

# Install curl & php-fpm
RUN apt-get install -y curl php7.3-fpm php php-redis php-curl php-mysql sendmail && chmod +x /bin/wordpress.sh

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php/

WORKDIR /var/www/wordpress

ENTRYPOINT [ "/bin/wordpress.sh" ]

CMD [ "php-fpm7.3", "-F" ]