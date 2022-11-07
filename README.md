# Masters and Nodes

1. execute node setting script
```bash
$ ./node-preset.sh
```

# Manager

1. execute manager setting script
```bash
$ ./manager.sh
$ ssh-copy-id {masters and nodes IP address}
```

2. update hosts inventory

3. check ping test
```bash
$ ansible -m ping all -i hosts
```

4. deploy k8s cluster
```bash
$ ansible-playbook -i hosts k8s-setup.yaml
```

5. deploy rook-ceph
```bash
$ ansible-playbook -i hosts ceph-setup.yaml

# get admin initial password
$ kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o yaml | grep "password:" | awk '{print $2}' | base64 --decode
```

6. deploy velero 

> pre-cond : minio setup [minio-setting](https://github.com/smilejj91/devops-setting/tree/main/minio)

```bash
$ ansible-playbook -i hosts velero-setup.yaml
```

* how to backup and restore
``` bash
# backup
$ velero create backup {backup-name} --include-namespaces {namespaces}

... delete application ... 

# restore
$ velero restore create --from-bakcup {backup-name}

# schedule
$ velero create schedule {backup-name} --schedule="0 7 * * *" --include-namespaces {namespace}
```

