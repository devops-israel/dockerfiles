#!/bin/sh

for v in `tail -n +2 versions.txt`; do
    mkdir -p versions/$v
    sed -e "s/ENV PUPPET_VERSION .*$/ENV PUPPET_VERSION $v/" Dockerfile > versions/$v/Dockerfile
done
