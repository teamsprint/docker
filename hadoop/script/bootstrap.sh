#!/bin/bash

# N is the node number of hadoop cluster
N=$1
PREFIX=$2

#if [ $#  0 ]
#then
#	echo "Please specify the node number and cluster prefix!"
#	exit 1
#fi

# change master name
sed -i -e "s/@@HADOOP_MASTER@@/${PREFIX}-master/g" $HADOOP_CONF_DIR/*.xml

# change slaves file
i=1
rm $HADOOP_CONF_DIR/slaves
while [ $i -lt $N ]
do
	echo "${PREFIX}-slave$i" >> $HADOOP_CONF_DIR/slaves
	((i++))
done 

service ssh start
bash

#eof
