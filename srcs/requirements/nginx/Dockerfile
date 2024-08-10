# Start from the alpine-based Nginx image
FROM debian:oldstable

# Update the package list and install openssl and nginx
RUN apt-get update && apt-get install -y nginx openssl

# -p is to not repeat if created
RUN mkdir -p /etc/nginx/ssl 

# Generate a self-signed certificate
# RUN sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/CN=localhost"

COPY ./conf/server.crt /etc/nginx/ssl/server.crt
COPY ./conf/server.key /etc/nginx/ssl/server.key

RUN mkdir /var/log/nginx/dsa-mora 

# Copy the configuration file and the HTML file
#COPY ./nginx/html/index.html /usr/share/nginx/html/index.html

# Expose the port
EXPOSE 443
#80 is web port and 443 internet port

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]

#Container é um processo do computador encapsulado e usa apenas os recursos do computador
#VM é uma virtualizacao do computador inteiro pq duplica o hardware do computador e usa-o