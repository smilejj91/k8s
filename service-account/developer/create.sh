#!/bin/bash

kubectl apply -f ns-developer.yaml
kubectl apply -f sa-developer.yaml
kubectl apply -f rb-developer.yaml
