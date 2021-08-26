// to create docker volume
docker volume create db-volume

// to run the docker image with tables initialized
docker run --name=db --rm -e MYSQL_ROOT_PASSWORD=toor \
--mount type=bind,src=/mnt/D/Project/flask_db_docker_integration/scripts/,dst=/docker-entrypoint-initdb.d/ \
-v db-volume:/var/lib/mysql \
mysql/mysql-server:8.0

// to debug a docker image use below command and provide password when asked in next step.
docker exec -it db mysql -uroot -p

// to build a docker image
docker build -t db -f ./Dockerfile_db .