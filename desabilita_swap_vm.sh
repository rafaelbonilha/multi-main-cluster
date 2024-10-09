# Desabilitando o Swap na VM
#! /bin/bash
sudo sed -Ei 's/(.*swap.*)/#\1/g' /etc/fstab
sudo swapoff -a