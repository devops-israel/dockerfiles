#!/bin/sh
# Run ES and dependent kibana
docker run -d --name elastic devopsil/elasticsearch:1.4.0beta1
docker run -d -p 80:5601 --link elastic:elastic --name kibana devopsil/kibana:4.0.0beta1
# docker run -d -p 80:80 --name kibana-proxy --link elastic:elastic --link kibana:kibana devopsil/kibana-proxy
