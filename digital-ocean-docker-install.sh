#! /bin/bash

apt-get update
apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

#
# add the following to /etc/apt/source.list.d/docker.list
#
# deb https://apt.dockerproject.org/repo ubuntu-xenial main
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list

apt-get update

apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual

apt-get -y install docker-engine

service docker start
