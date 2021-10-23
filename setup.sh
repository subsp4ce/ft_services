#! /bin/bash

GREEN='\033[1;38;5;42m'
RESET='\033[0m'

echo -e "${GREEN}starting minikube${RESET}"
minikube --vm-driver=virtualbox start

echo -e "${GREEN}open dashboard${RESET}"
minikube dashboard &

echo -e "${GREEN}enable minikube addons${RESET}"
minikube addons enable metallb
minikube addons enable metrics-server

echo -e "${GREEN}set docker environment${RESET}"
eval $(minikube docker-env)

echo -e "${GREEN}deploy metallb config and create secret${RESET}"
kubectl apply -f srcs/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo -e "${GREEN}create service account${RESET}"
kubectl create serviceaccount monitoring
kubectl apply -f srcs/serviceaccount.yaml

SVCS="nginx mysql phpmyadmin wordpress ftps influxdb telegraf grafana"

for SVC in $SVCS
do
    echo -e "${GREEN}build $SVC image${RESET}"
    docker build -t $SVC-image srcs/$SVC/
    echo -e "${GREEN}deploy $SVC${RESET}"
    kubectl apply -f srcs/$SVC/$SVC.yaml
done
