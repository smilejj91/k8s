#!/bin/bash

## prometheus directory

kubectl create namespace monitoring

cd prometheus/
kubectl create -f prometheus-cm.yaml 
kubectl create -f prometheus-crb.yaml 
kubectl create -f prometheus-cr.yaml 
kubectl create -f prometheus-deployment.yaml 
kubectl create -f prometheus-svc.yaml
kubectl create -f prometheus-node-exporter.yaml

## kube-state directory
cd ../kube-state
kubectl create -f kube-state-crb.yaml
kubectl create -f kube-state-cr.yaml
kubectl create -f kube-state-sa.yaml
kubectl create -f kube-state-deployment.yaml
kubectl create -f kube-state-svc.yaml

## grafana directory
cd ../grafana
kubectl create -f grafana-deployment.yaml
kubectl create -f grafana-svc.yaml
