FROM devopsil/puppet-yum

ENV PUPPET_VERSION 3.7.5

RUN yum install -y puppet-$PUPPET_VERSION \
    && yum clean all
