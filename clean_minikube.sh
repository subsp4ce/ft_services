#! /bin/bash

GREEN='\033[1;38;5;40m'
RESET='\033[0m'

SVCS="nginx mysql phpmyadmin wordpress ftps influxdb telegraf grafana"

for SVC in $SVCS
do
    echo -e "${GREEN}deleting $SVC${RESET}"
    kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount -l app=$SVC --wait=false
done

sleep 40
eval $(minikube docker-env)
yes | docker system prune -a

echo -e "${GREEN}stopping minikube${RESET}"
minikube stop

echo -e "${GREEN}deleting minikube${RESET}"
minikube delete
