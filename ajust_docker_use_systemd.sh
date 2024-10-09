#! /bin/bash
# Ajustando o Docker para usar o systemd que o k8s usa
#
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "journald"
}
EOF
# Reinicia o servico docker apos ajustar o daemon
sudo systemctl restart docker
