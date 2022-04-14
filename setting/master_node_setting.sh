#!/bin/bash

set -x
set -e

ADDRESS=$1

if [ -z ${ADDRESS} ]; then
  echo -e "please put argument!"
  exit 1
fi

kubeadm init --pod-network-cidr 10.244.0.0/16 --apiserver-advertise-address=${ADDRESS}

# run regular user
#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config

# run root user
export KUBECONFIG=/etc/kubernetes/admin.conf
echo 'export KUBECONFIG=/etc/kubernetes/admin.conf' >> ~/.bashrc

echo -e "keep token for joining worker node!!"
echo -e "also, you can generate token $ kubeadm token create --print-join-command "

# https://www.weave.works/docs/net/latest/kubernetes/kube-addon/
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
