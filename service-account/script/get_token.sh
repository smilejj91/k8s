#!/bin/bash
set -x
set -e

read -p 'service account name: ' SERVICEACCOUNT
read -p 'namespace you want to create: ' NAMESPACE

if [ -z ${NAMESPACE} ] || [ -z ${SERVICEACCOUNT} ]; then
  echo -e "please put arguement"
  exit 1;
fi 


kubectl -n ${NAMESPACE} describe secret $(kubectl -n ${NAMESPACE} get secret | grep ${SERVICEACCOUNT} | awk '{print $1}') | grep token: | awk '{print $2}'
