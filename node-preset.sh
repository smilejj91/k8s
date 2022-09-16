#!/bin/bash

if [ -e /etc/ssh/sshd_config ]; then
  sed -i 's@#PermitRootLogin prohibit-password@PermitRootLogin yes@g' /etc/ssh/sshd_config
  sed -i 's@#PasswordAuthentication@PasswordAuthentication@g' /etc/ssh/sshd_config
fi

systemctl restart sshd
