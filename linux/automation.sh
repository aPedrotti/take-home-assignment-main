#!/bin/bash

#tag=`date +%Y-%m-%d`
CI_COMMIT_SHORT_SHA=$(openssl rand -hex 4)

echo "--- Building a new image from Go Web-Srv App ... "
docker build -t my_new_image:latest -f ../dockerize/Dockerfile ../dockerize/. --no-cache

echo "--- Tagging with commit hash ..."
docker tag my_new_image:latest my_new_image:${CI_COMMIT_SHORT_SHA}

echo "--- Simulating pushing image to registry..."
echo "docker push --all-tags my_new_image"

echo "--- Creating new deployment file from script.yml"
cp script.yml new-app.yaml

echo "--- Updating new-app.yaml manifest ..."
sed -i "s/my_new_image:latest/my_new_image:${CI_COMMIT_SHORT_SHA}/g" new-app.yaml 

echo "--- Checking differences from current deployment ..."
kubectl diff -f new-app.yaml

