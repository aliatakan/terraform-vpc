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

 amazon-linux-extras install -y docker 
 service docker start
 usermod -a -G docker ec2-user
 curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
 chmod +x /usr/local/bin/docker-compose
 sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose version
sudo yum install git -y
history | cut -c 8-
curl -O https://concourse-ci.org/docker-compose.yml
my_ip=$(curl http://checkip.amazonaws.com)
sed -i "s/localhost/$my_ip/g" docker-compose.yml
docker-compose up -d
docker-compose ps 
wget -O ~/fly "http://localhost:8080/api/v1/cli?arch=amd64&platform=linux" 
sudo mkdir -p /usr/local/bin
sudo mv ~/fly /usr/local/bin
sudo chmod 0755 /usr/local/bin/fly
fly --target main login --concourse-url "http://localhost:8080" -u test -p test
git clone https://github.com/starkandwayne/concourse-tutorial.git
cd concourse-tutorial/tutorials/basic/task-hello-world
fly -t main execute -c task_hello_world.yml
history | cut -c 8-
docker run -d -v vault_home:/var -p 1234:1234 --cap-add=IPC_LOCK -e 'VAULT_DEV_ROOT_TOKEN_ID=myroot' -e 'VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:1234' vault

