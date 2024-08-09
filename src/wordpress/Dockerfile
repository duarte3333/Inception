FROM debian:oldstable 
#oldstable is the codename for Debian 10

# Install packages and update the image to the latest version of the packages 
RUN     apt-get update && \
        apt-get install -y  \
        php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip mariadb-server mariadb-client curl


RUN 	mkdir -p /var/run/ ; mkdir -p /run/php/ 
#/var/run/ for log files ; /var/run/php-fpm for php-fpm.pid file

COPY ./wordpress/conf/wp-config.php /
#configuration file
COPY ./wordpress/conf/www.conf /etc/php/7.4/fpm/pool.debian 
COPY ./wordpress/tools/start.sh .


# Download and install wordpress
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp

# Define comunication door
EXPOSE 9000

CMD ["bash", "./start.sh"]