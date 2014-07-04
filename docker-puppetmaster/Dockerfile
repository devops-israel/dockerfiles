FROM devopsil/puppet:latest

RUN yum install puppet-server -y && yum clean all
ADD puppet.conf /etc/puppet/puppet.conf

VOLUME ["/opt/puppet"]

EXPOSE 8140

ENTRYPOINT [ "/usr/bin/puppet", "master", "--no-daemonize", "--verbose" ]
