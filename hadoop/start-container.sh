#!/bin/bash

# the default node number is 3
# this should be less than slave# in config/slaves
# you can increase with resize-cluster.sh but this needs rebuild
# (if there's cache enabled, this doesn't take long time)
# having to many slaves in advance will lead to seeing more warning messages
# (when you start-hadoop.sh)
N=${1:-3}

SUDO=""

# start hadoop master container
$SUDO docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
$SUDO docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
                teamsprint/hadoop &> /dev/null

# start hadoop slave container
#i=1
#while [ $i -lt $N ]
#do
#	$SUDO docker rm -f hadoop-slave$i &> /dev/null
#	echo "start hadoop-slave$i container..."
#	$SUDO docker run -td \
#	                --net=hadoop \
#	                --name hadoop-slave$i \
#	                --hostname hadoop-slave$i \
#	                teamsprint/hadoop &> /dev/null
#	i=$(( $i + 1 ))
#done 
#
# get into hadoop master container
#$SUDO docker exec -it hadoop-master /root/resize-cluster.sh $i
$SUDO docker exec -it hadoop-master bash
