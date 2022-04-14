#!/bin/bash

kubectl delete clusterrole ingress-nginx 
kubectl delete clusterrole nginx-ingress-clusterrole 
kubectl delete clusterrole ingress-nginx-admission 
kubectl delete clusterrolebinding ingress-nginx 
kubectl delete clusterrolebinding ingress-nginx-admission 
kubectl delete validatingwebhookconfiguration ingress-nginx-admission 
kubectl delete namespace ingress-nginx 
