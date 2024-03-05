

all: 
#Command to build the docker's images and run the container's services
	@docker-compose -f src/compose.yml up --build 

down:
#Command to stop the container's services
	@docker-compose -f src/compose.yml down 