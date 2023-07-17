kubeadm init --pod-network-cidr=10.244.0.0/16

/opt/scripts/fix_config_issue.sh

/opt/scripts/add_flannel.sh
