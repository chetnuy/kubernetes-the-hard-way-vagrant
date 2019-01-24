#!/bin/bash

set -euo pipefail

case "$(hostname)" in
  worker)
    route add -net 10.20.0.0/16 gw 192.168.121.20
    ;;
  *)
    route add -net 10.20.0.0/16 gw 192.168.121.20
    ;;
esac
