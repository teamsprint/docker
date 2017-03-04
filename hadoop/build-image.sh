#!/bin/bash

echo ""

IMAGE_VERSION=1.7

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t teamsprint/hadoop:$IMAGE_VERSION .
sudo docker tag teamsprint/hadoop:$IMAGE_VERSION teamsprint/hadoop:latest

echo ""
