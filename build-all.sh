#!/bin/sh
set -e
pushd $(dirname $0)
for image in base puppet-yum puppet puppetmaster nginx; do
  docker-${image}/build.sh
done
