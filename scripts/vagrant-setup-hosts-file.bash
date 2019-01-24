#!/bin/bash

set -euo pipefail

cat <<EOF | sudo tee -a /etc/hosts
192.168.121.10 controller
192.168.121.20 worker
EOF
