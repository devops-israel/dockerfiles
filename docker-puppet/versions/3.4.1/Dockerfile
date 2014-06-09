FROM centos:latest
MAINTAINER Evgeny Zislis <evgeny@devops.co.il>

RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs && \
    rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

RUN yum install -y puppet-3.4.1
