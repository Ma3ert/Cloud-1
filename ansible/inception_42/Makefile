NGINX_DOCKERFILE = ./srcs/requirements/nginx/Dockerfile
MARIADB_DOCKERFILE = ./srcs/requirements/mariaDB/Dockerfile
WORDPRESS_DOCKERFILE = ./srcs/requirements/wordpress/Dockerfile

NGINX = nginx
MARIADB = mariaDB
WORDPRESS = wordpress

all: hoho

hoho: directory
	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

directory:
	sudo mkdir -p ~/Desktop/data/wordpress
	sudo mkdir -p ~/Desktop/data/database

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	docker volume rm $$(docker volume ls -q)
	sudo rm -rf ~/Desktop/data/*