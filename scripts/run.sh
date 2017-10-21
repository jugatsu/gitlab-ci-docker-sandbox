#!/usr/bin/env bash

# configure shell
eval $(docker-machine env docker-gitlab)

# export variable for docker-machine ip address
export DOCKER_MACHINE_IP="$(docker-machine ip docker-gitlab)"

# create folders on docker host for using with bind volumes
docker-machine ssh docker-gitlab sudo mkdir -p /srv/gitlab/{configs,logs,data}
docker-machine ssh docker-gitlab sudo mkdir -p /srv/gitlab-runner/config

# start gitlab container only
docker-compose up -d gitlab

echo
echo '********************************************************************'
echo "Your Gitlab instance should be reachable at http://$DOCKER_MACHINE_IP"
echo 'Note: it takes about two minutes to make Gitlab ready.'
echo '********************************************************************'
echo
