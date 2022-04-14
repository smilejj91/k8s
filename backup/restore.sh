#!/bin/bash

service kube-apiserver stop

export ETCDCTL_API=3
etcdctl --cacert=/etc/kubernetes/pki/etcd/ca.crt \
	--cert=/etc/kubernetes/pki/etcd/server.crt \
	--key=/etc/kubernetes/pki/etcd/server.key \
	--data-dir=/var/lib/etcd-backup
	snapshot restore /opt/etcdbackup

sed -i 's@path\: \/var\/lib\/etcd@path\: \/var\/lib\/etcd-backup@g' /etc/kubernetes/manifests/etcd.yaml

systemctl daemon-reload
service etcd restart
service kube-apiserver start



