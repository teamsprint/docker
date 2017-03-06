#!/bin/bash

echo ""

IMAGE_VERSION=1.8
REPO=teamsprint/hadoop
TAG=$IMAGE_VERSION

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t $REPO:$TAG .
sudo docker tag $REPO:$TAG $REPO:latest 
echo ""
