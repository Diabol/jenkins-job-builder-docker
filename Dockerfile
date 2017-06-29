FROM ubuntu:16.04
MAINTAINER "Tommy Tynjä <tommy.tynja@diabol.se>"

WORKDIR /root
RUN apt-get update && apt-get -y upgrade && apt-get -y install python-pip python-dev build-essential && \
    pip install pyYAML six tox python-jenkins && \
    apt-get -y install --no-install-recommends git && git clone https://github.com/openstack-infra/jenkins-job-builder.git && \
    cd /root/jenkins-job-builder && \
    git checkout 1.6.2 && \
    python setup.py install && \
    mkdir -p /etc/jenkins_jobs/
ADD jenkins_jobs.ini /etc/jenkins_jobs/jenkins_jobs.ini
WORKDIR /root/jenkins-job-builder
