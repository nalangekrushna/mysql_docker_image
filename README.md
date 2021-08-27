// to create docker volume
docker volume create db-volume

// to run the docker image with tables initialized
docker run --name=db --rm -e MYSQL_ROOT_PASSWORD=toor \
--mount type=bind,src=/mnt/D/Project/flask_db_docker_integration/scripts/,dst=/docker-entrypoint-initdb.d/ \
-v db-volume:/var/lib/mysql --network website_network --expose 3306 \
mysql/mysql-server:8.0

// to debug a docker image use below command and provide password when asked in next step.
docker exec -it db mysql -uroot -p

FAQ
1. mysql Error 1130 
https://stackoverflow.com/questions/44590775/mysql-in-docker-compose-access-denied/44591374#44591374

2. mysql Error 1410
run mysql container and login inside it in debugging mode and run below commands.
CREATE USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'toor';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
