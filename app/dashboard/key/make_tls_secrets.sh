#!/bin/bash

openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout tmax-dashboard-tls.key -out tmax-dashboard-tls.cert
kubectl create secret tls tmax-dashboard-tls --key tmax-dashboard-tls.key --cert tmax-dashboard-tls.cert --namespace kubernetes-dashboard
