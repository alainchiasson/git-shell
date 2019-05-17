FROM centos:7

RUN adduser jenkins -u 1000

RUN yum update -y && \
    yum install -y git openssh-client &&\
    yum clean all && \
    rm -rf /var/cache/yum

# This key is generated from git.
# TODO: either refresh in repo or when building Image
COPY .ssh /home/jenkins/.ssh

USER jenkins
WORKDIR /home/jenkins
