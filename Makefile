

all: 
#Command to build the docker's images and run the container's services
	@docker-compose -f src/compose.yml up --build 

down:
#Command to stop the container's services
	@docker-compose -f src/compose.yml down 

clean:
	- docker stop $$(docker ps -a -q)
	- docker rm $$(docker ps -a -q)
	- docker rmi $$(docker images -q)
	- docker volume rm $$(docker volume ls -q)
	- docker network rm $$(docker network ls -q)