#!/bin/sh
set -e
pushd $(dirname $0)
docker build -t devopsil/elasticsearch:1.4.0beta1 .
