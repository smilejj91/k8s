#!/bin/bash

set -e #error handling

read -p 'service account name: ' name
read -p 'namespace you want to create: ' namespace

if [ -z "$name" ] || [ -z "$namespace" ];
then
  echo "please provide the input - serviceaccount and namespace"
  exit 1
fi

kubectl create ns $namespace
kubectl create serviceaccount $name -n $namespace
kubectl create rolebinding $name --clusterrole=edit --serviceaccount="$namespace:$name" --namespace=$namespace

server=$(kubectl cluster-info | grep -m 1 -o "https.*.:6443")
token_name=$(kubectl -n $namespace get serviceaccount $name -o jsonpath='{.secrets[].name}')
ca=$(kubectl -n $namespace get secret/$token_name -o jsonpath='{.data.ca\.crt}')
token=$(kubectl -n $namespace get secret/$token_name -o jsonpath='{.data.token}' | base64 --decode)
cluster=$(kubectl config view --minify -o jsonpath='{.clusters[].name}')

echo "
apiVersion: v1
kind: Config
clusters:
- name: kubernetes
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: developer-context
  context:
    cluster: ${cluster}
    namespace: ${namespace}
    user: ${name}
current-context: developer-context
users:
- name: ${name}
  user:
    token: ${token}
" > kubeconfig

# run regular user
echo -e "you should copy kubeconfig file to your home directory"
echo -e "$ mkdir -p \$HOME/.kube"
echo -e "$ sudo cp -i kubeconfig \$HOME/.kube/config"
echo -e "$ sudo chown \$(id -u):\$(id -g) \$HOME/.kube/config"
echo -e "$ export KUBECONFIG=\$HOME/.kube/config"
