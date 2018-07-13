##################################################
# @author: Kristof Goossens
# @description: Setup CentOS to use Docker
##################################################


# Cleanup old versions
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

# Setup Repository
## Prereqs
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

## Add repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

## Install docker-ce
sudo yum install docker-ce

## Enable docker-ce
sudo systemctl enable docker

## Start docker-ce
sudo systemctl start docker

## Allow running docker with non-root user (requires logout/login to work)
sudo usermod -aG docker sysadmin

## Create demo-net network
docker network create --subnet 172.50.0.0/16 --gateway 172.50.0.1 demo-net