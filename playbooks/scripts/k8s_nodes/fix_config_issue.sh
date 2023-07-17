mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/kubelet.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
