#! /bin/bash
#
# Instalando os componentes do balancer
#
# Instalando o pre requisito
sudo apt install -y haproxy vim
#
# Ajustando o arquivo haproxy.cfg
#
sudo su
cat > /etc/haproxy/haproxy.cfg <<EOF
global
user haproxy
group haproxy

defaults
mode http
log global
retries 2
timeout connect 3000ms
timeout server 5000ms
timeout client 5000ms

frontend kubernetes
bind 172.27.11.200:6443
option tcplog
mode tcp
default_backend kubernetes-main-nodes

backend kubernetes-main-nodes
mode tcp
balance roundrobin
option tcp-check
server k8s-main-0 172.27.11.10:6443 check fall 3 rise 2
server k8s-main-1 172.27.11.20:6443 check fall 3 rise 2
server k8s-main-2 172.27.11.30:6443 check fall 3 rise 2
EOF
#
# Reiniciando o serviço apos os ajustes
#
sudo systemctl restart haproxy
#
# Verifica o status do servico
sudo systemctl status haproxy
#
# Valida se a porta foi configurada corretamente
#
ss -nltp | grep 6443
