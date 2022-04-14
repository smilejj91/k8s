#!/bin/bash

set -x

read -p 'service account name: ' name
read -p 'namespace you want to delete: ' namespace

if [ -z "$name" ] || [ -z "$namespace" ];
then
  echo "please provide the input - serviceaccount and namespace"
  exit 1
fi

kubectl delete rolebinding $name --namespace=$namespace
kubectl delete serviceaccount $name -n $namespace
kubectl delete ns $namespace
