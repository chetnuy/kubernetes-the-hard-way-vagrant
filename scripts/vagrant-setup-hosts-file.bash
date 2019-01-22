#!/bin/bash

set -euo pipefail

cat <<EOF | sudo tee -a /etc/hosts

# KTHW Vagrant machines
192.168.121.10 controller
192.168.121.20 worker-0
192.168.121.21 worker-1
EOF
