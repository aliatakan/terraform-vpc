#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
apt-get update
#apt-get -y install nginx

# make sure nginx is started
#service nginx start

 amazon-linux-extras install docker
 service docker start
 usermod -a -G docker ec2-user
 curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
 chmod +x /usr/local/bin/docker-compose
docker-compose version
sudo yum install git -y
history | cut -c 8-
