#!/bin/sh
# Run ES and dependent kibana
docker run -d --name elastic devopsil/elasticsearch:1.4.0beta1
docker run -d -p 5601:5601 --name kibana --link elastic:elastic -t devopsil/kibana:4.0.0beta1
