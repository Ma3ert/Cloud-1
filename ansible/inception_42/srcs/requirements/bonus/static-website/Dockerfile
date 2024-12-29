FROM debian:buster

RUN mkdir -p /var/www/srcs && chown -R www-data:www-data /var/www/srcs

COPY ./srcs /var/www/srcs

RUN apt-get update && apt-get install apache2 -y

COPY ./conf/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]