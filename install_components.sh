#! /bin/bash
# Execute nos outros mains!
#
# Atualizando o Sistema
sudo apt update
#
# Instalando os pre requisitos
sudo apt install -y apt-transport-https ca-certificates curl gpg software-properties-common vim
#
# Instalando o docker
curl -fsSL https://get.docker.com/ | sh
sudo apt update
#
# Instalando o kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#
# Instalando o kubeadm e o kubelet
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
# Para atualizar as listas de repositorios, rodamos novamente o apt update
sudo apt update 
sudo apt install -y kubelet kubeadm
sudo apt-mark hold kubelet kubeadm kubectl
