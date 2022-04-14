#!/bin/bash

apt-get update && apt-get install etcd-client

kubectl get all -A -o yaml > all-deploy-services.yaml

export ETCDCTL_API=3
etcdctl --cacert=/etc/kubernetes/pki/etcd/ca.crt \
	--cert=/etc/kubernetes/pki/etcd/server.crt \
	--key=/etc/kubernetes/pki/etcd/server.key \
	snapshot save /opt/etcdbackup



