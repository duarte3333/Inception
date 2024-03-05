if [-d "/var/lib/mysql/$MYSQL_DATABASE"]; #check if the directory exists
then
    echo "Data directory already exists"

mysql_install_db                 #command to install the database files in the directory /var/lib/mysql 
service mariadb start            #start the mariadb service
mysql_secure_installation << EOF #command to secure the installation because the default installation is not secure

n
y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
n
y
y
EOF

mysql -u $MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" 
#query is a command to connect to the database
mysql -u $MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
#@ and % serve to accept connections from any host
mysql -u $MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -u $MYSQL_ROOT_USER -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
#the flush privileges is a command to reload the tables in the mysql database

sleep 5 #garantee time for the database to be created
service mariadb stop #stop the mariadb service
fi 

exec mysqld_safe --bind-address=0.0.0.0 
#this command is to start the mariadb service and bind the address to
