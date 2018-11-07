#!/bin/bash
set -e

if [ $# -ne 1 ]; then
    echo "Usage: $(basename $0) hostname" 1>&2
    exit 1
fi

host=$1
docker save jakm/auth-demo-app | ssh -C $host docker load
docker save jakm/auth-demo-login | ssh -C $host docker load
docker save jakm/auth-demo-resource | ssh -C $host docker load
