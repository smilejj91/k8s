#!/bin/bash

apt update && apt install -y ansible

ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa <<<y 
