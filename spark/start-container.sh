#!/bin/bash

CONTAINER_NAME=spark-master
REPO=teamsprint/spark
TAG=latest

NETWORK_NAME=hadoop

echo "start $CONTAINER_NAME} container..."
sudo docker rm -f $CONTAINER_NAME &> /dev/null
sudo docker run -id \
                -p 7077:7077 \
                --net=$NETWORK_NAME \
                --name $CONTAINER_NAME \
                --hostname $CONTAINER_NAME \
                $REPO:$TAG &> /dev/null

# get into mysql-metastore container
sudo docker exec -it $CONTAINER_NAME bash

#eof
