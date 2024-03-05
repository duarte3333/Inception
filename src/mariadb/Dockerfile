FROM debian:12

# Update the package list and install mariadb-server
RUN apt-get update && apt-get install -y mariadb-server

# Create the mysql directory and change the owner to the mysql user
# The chown command changes the owner of the /var/run/mysql directory to the mysql user
RUN mkdir -p /run/mysql 
RUN chown -R mysql:mysql /run/mysql

RUN mkdir -p /var/run/mysql 
RUN chown -R mysql:mysql /var/run/mysql
RUN chmod 777 /var/run/mysql

#Copy the start.sh file to the current directory
COPY ./mariadb/tools/start.sh .
RUN chmod 777 start.sh

#Expose to the port 3306 - the mysql port
EXPOSE 3306

#Start the mariadb server
CMD ["bash", "start.sh"]