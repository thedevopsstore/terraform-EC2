#!/bin/bash 

apt-get update
apt-get install -y git wget

# Install Docker
apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
apt-get update

apt-get install -yq docker-ce docker-ce-cli containerd.io

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update -y

sudo apt-get install -y  kubelet kubeadm kubectl kubernetes-cni nfs-common

# Install Docker Compose 
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


sudo sysctl net.bridge.bridge-nf-call-iptables=1
sudo swapoff -a

sudo rm -rf /var/lib/kubelet/*

sudo apt-get install nfs-common -y
