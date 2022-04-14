#!/bin/bash

kubectl apply -f metallb-config.yml
kubectl delete pods --namespace=metallb-system --all
