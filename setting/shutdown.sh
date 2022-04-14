#!/bin/bash

nodes=$(kubectl get nodes -o name)

for node in ${nodes[@]}
do
  if [ $node != "node/kubemaster" ]; then
    echo "=== shutdown $node ==="
    #ssh $node sudo shutdown -h 1
  fi
done
