#!/bin/bash

# the default node number is 3 (include master node)
N=${1:-3}

MASTER_CONTAINER=hadoop-master
SLAVE_CONTAINER=hadoop-slave

REPO=teamsprint/hive
TAG=vimed

echo "start hive-master container..."
docker rm -f $MASTER_NAME &> /dev/null
docker run -itd \
           --net=hadoop \
           -p 50070:50070 \
           -p 8088:8088 \
           --name $MASTER_CONTAINER \
           --hostname $MASTER_CONTAINER \
           $REPO:$TAG &> /dev/null


# start hive(hadoop) slave container
i=1
while [ $i -lt $N ]
do
	echo "start hive-slave$i container..."
	docker rm -f ${SLAVE_CONTAINER}$i &> /dev/null
	docker run -td \
               --net=hadoop \
               --name ${SLAVE_CONTAINER}$i \
               --hostname ${SLAVE_CONTAINER}$i \
               $REPO:$TAG &> /dev/null
	i=$(( $i + 1 ))
done 

# start mysql metastore

# get into hive master container
docker exec -it $MASTER_CONTAINER /root/resize-cluster.sh $i
docker exec -it $MASTER_CONTAINER bash
