#!/bin/bash

check_requirements(){
  if ! command -v minikube &> /dev/null; then
    echo "* Install minikube;" && \
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&\
    sudo install minikube-linux-amd64 /usr/local/bin/minikube && \
    rm -rf minikube-linux-amd64
  fi 
  if ! command -v docker &> /dev/null; then
    echo "***Could not find docker. Cannot proceed." && exit 1
  fi
  if ! command -v kubectl &> /dev/null; then
    echo "***Could not find kubectl. Cannot proceed." && exit 1
  fi
  if [[ $(minikube status) != 0 ]]; then
    echo "--- Starting a demo-cluster"
    minikube start 
  fi
}

check_requirements

eval $(minikube docker-env) 

echo "* Build image to deploy;"
docker build -t myapp-web:latest -f ../dockerize/Dockerfile ../dockerize --no-cache

echo "* Create namespace;"
minikube kubectl -- apply -f namespace.yaml

echo "* Create Deployment and service;"
minikube kubectl -- apply -f app.yaml

minikube kubectl -- get pods -n ns-web-apps

echo "! Once deployment is running you can forward you local port to the pod with the following command so you can access app via http://localhost:8080  
minikube kubectl -- port-forward deploy/dp-myapp-web -n ns-web-apps 8080:8080 &

- You can run this following command to follow deployments readiness;
watch minikube kubectl -- get pods -n ns-web-apps"