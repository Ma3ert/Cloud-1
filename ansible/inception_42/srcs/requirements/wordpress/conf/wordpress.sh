#!/bin/sh

# Using curl to get wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar

# Move the file
mv wp-cli.phar /usr/local/bin/wp

# A condition to check if wordpress is already there
if [ ! -f /var/www/wordpress/wp-config-sample.php ]; then

# Download wordpress & create wordpress config file
wp core download --allow-root && cat wp-config-sample.php > wp-config.php && chmod +x wp-config.php

# Set database name
wp config set DB_NAME $DATABASE_NAME --allow-root

# Set database username
wp config set DB_USER $DATABASE_USER --allow-root

# Set passoword for database username
wp config set DB_PASSWORD $USER_PASSWORD --allow-root

# Set database hostname
wp config set DB_HOST $DATABASE_HOST --allow-root

# Set var for the redis conf
wp config set WP_REDIS_HOST "redis" --allow-root
wp config set WP_REDIS_PORT "6379" --allow-root
wp config set WP_REDIS_TIMEOUT "1" --allow-root
wp config set WP_REDIS_READ_TIMEOUT "1" --allow-root
wp config set WP_REDIS_DATABASE "0" --allow-root

# Install wordpress
wp core install --title=$TITLE --url=$URL --admin_name=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASS --role=author --allow-root

# wp theme install neve --activate --allow-root
wp theme install greenshift --path=/var/www/wordpress  --activate --allow-root

# Install plugin
wp plugin install redis-cache --path=/var/www/wordpress  --activate --allow-root

# Update & enable
wp redis update-dropin --path=/var/www/wordpress  --allow-root 

wp redis enable --allow-root

fi

exec "$@"