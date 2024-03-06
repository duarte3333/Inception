sed -ie "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
#sed is used for replacing the string in the file with the new string 

#everything that has the container name it replaces by the ip address

echo "---------------------------------"
wall " Printing the environment variables"
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
echo "DB_HOST: $DB_HOST"
echo "WP_URL: $WP_URL"
echo "WP_TITLE: $WP_TITLE"
echo "WP_ADMIN: $WP_ADMIN"
echo "WP_ADMIN_PASSWORD: $WP_ADMIN_PASSWORD"
echo "WP_USER: $WP_USER"
echo "WP_USER_PASSWORD: $WP_USER_PASSWORD"
echo "---------------------------------"


if [ ! -f /var/www/html/wp-config.php ]; then #check if the file exists
	
	cd /var/www/html/ #change the directory to /var/www/html

    #this command is to replace the string in the file wp-config.php with the new string
	sed -i "s/__MYSQL_DATABASE__/'$MYSQL_DATABASE'/g" /var/www/html/wp-config.php 
	sed -i "s/__MYSQL_USER__/'$MYSQL_USER'/g" /var/www/html/wp-config.php
	sed -i "s/__MYSQL_PASSWORD__/'$MYSQL_PASSWORD'/g" /var/www/html/wp-config.php
	sed -i "s/__DB_HOST__/'$DB_HOST'/g" /var/www/html/wp-config.php
	
	wp core download --allow-root #download the wordpress core
	until mysqladmin -hmariadb -u${MYSQL_USER} -p${MYSQL_PASSWORD} ping; do #until the database is created
       sleep 2
    done
    #this command is to create the database
	wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb:3306 --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email="$WP_ADMIN@student.42.fr" --allow-root
	wp user create ${WP_USER} "$WP_USER"@user.com --role=author --user_pass=${WP_USER_PASSWORD} --allow-root

	#chown -R www-data:www-data /var/www/html/wp-content #change the owner of the directory to www-data
fi


exec /usr/sbin/php-fpm7.4 -F #start the php-fpm service and keep it running in the foreground 