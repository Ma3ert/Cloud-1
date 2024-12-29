FROM debian:buster

EXPOSE 443

RUN apt-get update && apt-get -y install nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
	-keyout /etc/nginx/ssl/yait-iaz.key \
	-out /etc/nginx/ssl/yait-iaz.crt \
	-subj "/C=MO/ST=KHORIBGA/L=KHORIBGA/O=1337 School/OU=yait-iaz/CN=yait-iaz/"

COPY ./conf/default /etc/nginx/conf.d/nginx.conf

COPY ./conf/index.html /var/www/wordpress/index.html

CMD [ "nginx", "-g", "daemon off;" ]
