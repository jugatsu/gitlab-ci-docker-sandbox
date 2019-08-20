#!/usr/bin/env sh
set -e

export GITLAB_ROOT_PASSWORD="$(openssl rand -base64 8)"

# start containers
docker-compose up -d 2>/dev/null

echo
echo '*****************************************************************************'
echo "Your Gitlab instance should be reachable at http://host.docker.internal:8929"
echo 'Note: it takes about two minutes to make Gitlab ready.'
echo 'login:    root'
echo "password: $GITLAB_ROOT_PASSWORD"
echo '******************************************************************************'
echo
