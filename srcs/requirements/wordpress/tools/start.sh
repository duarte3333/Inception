
# Modify PHP-FPM configuration
sed -ie "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf

# Print environment variables
echo "---------------------------------"
wall " Printing the environment variables"
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
echo "DB_HOST: $HOST_NAME"
echo "WP_URL: $WP_URL"
echo "WP_TITLE: $WP_TITLE"
echo "WP_ADMIN: $WP_ADMIN"
echo "WP_ADMIN_PASSWORD: $WP_ADMIN_PASSWORD"
echo "WP_USER: $WP_USER"
echo "WP_USER_PASSWORD: $WP_USER_PASSWORD"
echo "---------------------------------"

# Check if wp-config.php exists
if [ ! -f /var/www/html/wp-config.php ]; then
    mv ./wp-config.php /var/www/html/
    cd /var/www/html/
    ls

    # Change the ownership of the wp-config.php file to the current user
    chown $(whoami):$(whoami) /var/www/html/wp-config.php

    # Replace placeholders in wp-config.php with actual values
    sed -i "s/__MYSQL_DATABASE__/'$MYSQL_DATABASE'/g" /var/www/html/wp-config.php 
    sed -i "s/__MYSQL_USER__/'$MYSQL_USER'/g" /var/www/html/wp-config.php
    sed -i "s/__MYSQL_PASSWORD__/'$MYSQL_PASSWORD'/g" /var/www/html/wp-config.php
    sed -i "s/__DOCKERCONTAINERNAME__/'$HOST_NAME'/g" /var/www/html/wp-config.php

    # Download WordPress core
    wp core download --allow-root

    # Wait for the database to be ready
    until mysqladmin -hmariadb -u${MYSQL_USER} -p${MYSQL_PASSWORD} ping; do
       sleep 2
    done

    # Create WordPress configuration
    # wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb:3306 --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

    # Install WordPress
    wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email="$WP_ADMIN@student.42.fr" --allow-root

    # Create a WordPress user
    wp user create ${WP_USER} "$WP_USER"@user.com --role=author --user_pass=${WP_USER_PASSWORD} --allow-root

    # Change the owner of the wp-content directory to www-data
    chown -R www-data:www-data /var/www/html/wp-content
fi

# Start PHP-FPM in the foreground
exec /usr/sbin/php-fpm7.4 -F