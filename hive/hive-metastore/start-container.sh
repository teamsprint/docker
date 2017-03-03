#!/bin/bash

SUDO=""

CONTAINER_NAME=hive-metastore-mysql
REPO=teamsprint/hive-metastore
TAG=latest

# start mysql-metastore container
$SUDO docker rm -f $CONTAINER_NAME &> /dev/null
echo "start $CONTAINER_NAME container..."
$SUDO docker run -d \
                -p 3306:3306 \
                --net=hadoop \
                --name $CONTAINER_NAME \
                --hostname $CONTAINER_NAME \
                --env MYSQL_ROOT_PASSWORD=root \
                $REPO:$TAG &> /dev/null

# get into mysql-metastore container
$SUDO docker exec -it $CONTAINER_NAME ./create-user.sh
$SUDO docker exec -it $CONTAINER_NAME bash

#eof
