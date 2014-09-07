#!/bin/sh

for v in `cat versions.txt`; do
    mkdir -p versions/$v
    sed -e "s/ENV PUPPET_VERSION .*$/ENV PUPPET_VERSION $v/" Dockerfile > versions/$v/Dockerfile
done
