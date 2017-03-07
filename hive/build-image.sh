#!/bin/bash

echo ""

IMAGE_VERSION=1.9
REPO=teamsprint/hive
TAG=$IMAGE_VERSION

echo -e "\nbuild docker hive image\n"
sudo docker build -t $REPO:$TAG .
sudo docker tag $REPO:$TAG $REPO:latest

echo ""
