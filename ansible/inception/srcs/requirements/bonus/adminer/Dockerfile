FROM debian:buster

RUN apt-get update && apt-get install -y wget php php-mysql adminer

RUN mkdir -p /var/www/adminer/

RUN wget "https://www.adminer.org/latest.php" -O /var/www/adminer/adminer.php

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/adminer"]