#!/bin/bash

kubectl create namespace logging
kubectl create -f fluent-bit-service-account.yaml
kubectl create -f fluent-bit-role-1.22.yaml
kubectl create -f fluent-bit-role-binding-1.22.yaml
kubectl create -f fluent-bit-configmap.yaml
kubectl create -f fluent-bit-ds.yaml

