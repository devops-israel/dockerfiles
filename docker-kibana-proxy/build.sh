#!/bin/sh
set -e
pushd $(dirname $0)
docker build -t devopsil/kibana-proxy .
