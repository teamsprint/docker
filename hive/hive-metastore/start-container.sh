#!/bin/bash

CONTAINER_NAME=hive-metastore-mysql
REPO=teamsprint/hive-metastore-mysql
TAG=latest

NETWORK_NAME=hadoop

echo "start $CONTAINER_NAME container..."
sudo docker rm -f $CONTAINER_NAME &> /dev/null
sudo docker run -d \
                -p 3306:3306 \
                --net=$NETWORK_NAME \
                --name $CONTAINER_NAME \
                --hostname $CONTAINER_NAME \
                --env MYSQL_ROOT_PASSWORD=root \
                $REPO:$TAG &> /dev/null

# get into mysql-metastore container
sudo docker exec -it $CONTAINER_NAME ./create-user.sh
sudo docker exec -it $CONTAINER_NAME bash

#eof
