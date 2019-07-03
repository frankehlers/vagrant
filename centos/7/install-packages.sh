#!/bin/bash

# update yum
yum update -y

# enable software collections
sudo yum install -y centos-release-scl

# install general tools
sudo yum install -y git mc nano nmap

# install python3.6 and change shell environment variables
sudo yum install -y rh-python36
scl enable rh-python36 bash

# install development tools
sudo yum groupinstall -y 'Development Tools'

## install docker
# uninstall old docker versions
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# install utilities
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# add repo
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# install docker ce
sudo yum install -y docker-ce docker-ce-cli containerd.io

# start docker service
sudo systemctl start docker

