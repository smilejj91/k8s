# Quick start to setting k8s cluster

1. Master node setting
 - Go to master node
 - $ cd setting && ./master_node_setting.sh {IP address}

2. Worker node setting
 - Go to worker node 
 - $ cd setting && ./node_setting_debian.sh (if you use ubuntu, please run ./node_setting_ubuntu.sh)

3. Join master node
 - Go to master node
 - Copy output from command ($ kubeadm token create --print-join-command)
 - Go to worker node
 - Paste output and execute

[Optional]

4. ingress-nginx + metalLB setting
 - If you want to use Loadbalancer, you can use this.
 - metalLB 
   - $ cd metalLB
   - modify metallb-config.yml
     - please modify address ip range (ex. 192.168.1.239-192.168.1.240)
   - $ kubectl apply -f metallb-config.yml
   - $ kubectl apply -f metallb.yml
 - ingress-nginx
   - $ cd ingress-nginx
   - modify deploy.yaml (if you need)
     - ConfigMap
     - Deployment setting (ex. args)
   - $ kubectl apply -f deploy.yaml

5. Some apps.
 - You can use dashboard, prometheus, grafana, redmine, mediawiki after modifying yaml file
