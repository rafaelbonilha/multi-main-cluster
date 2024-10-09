#! /bin/bash
# Ajuste pro kubelet usar um IP pre-definido
#
echo "KUBELET_EXTRA_ARGS='--node-ip=172.27.11.10'" > /etc/default/kubelet
