#!/bin/bash

echo ""

IMAGE_VERSION=local

echo -e "\nbuild docker hive image\n"
sudo docker build -t teamsprint/hive:$IMAGE_VERSION .
sudo docker tag teamsprint/hive:$IMAGE_VERSION teamsprint/hive:local

echo ""
