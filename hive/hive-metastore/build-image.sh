#!/bin/bash

echo ""

IMAGE_VERSION=1.5
REPO=teamsprint/hive-metastore
TAG=mysql-$IMAGE_VERSION

echo -e "\nbuild docker hive metastore (mysql) image\n"
sudo docker build -t $REPO:$TAG .
sudo docker tag $REPO:$TAG $REPO:latest

echo ""
