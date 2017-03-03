#!/bin/bash

# the default node number is 3 (include master node)
N=${1:-3}

SUDO=""

MASTER_CONTAINER=hadoop-master
SLAVE_CONTAINER=hadoop-slave

REPO=teamsprint/hive
TAG=1.6

NETWORK_NAME=hadoop

echo "start $MASTER_CONTAINER container..."
$SUDO docker rm -f $MASTER_NAME &> /dev/null
$SUDO docker run -itd \
           --net=$NETWORK_NAME \
           -p 50070:50070 \
           -p 8088:8088 \
           --name $MASTER_CONTAINER \
           --hostname $MASTER_CONTAINER \
           $REPO:$TAG &> /dev/null


# start slave containers
i=1
while [ $i -lt $N ]
do
    echo "start ${SLAVE_CONTAINER}$i container..."
    $SUDO docker rm -f ${SLAVE_CONTAINER}$i &> /dev/null
    $SUDO docker run -td \
               --net=$NETWORK_NAME \
               --name ${SLAVE_CONTAINER}$i \
               --hostname ${SLAVE_CONTAINER}$i \
               $REPO:$TAG &> /dev/null
    i=$(( $i + 1 ))
done 

# start mysql metastore

# get into hive container
docker exec -it $MASTER_CONTAINER /root/resize-cluster.sh $i
docker exec -it $MASTER_CONTAINER bash
