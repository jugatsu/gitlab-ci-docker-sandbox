# Description

A Simple sandbox for playing around with [Gitlab](https://about.gitlab.com) CI using [Docker](https://www.docker.com).

## Usage

:point_up: Make sure to edit the `.env` to meet your environment:

```bash
$ cp .env.example .env
```

#### Start Gitlab and Gitlab Runner

```bash
$ docker-compose up -d
```

#### Copy registration token from project CI settings

![2017-10-21 12 48 27](https://user-images.githubusercontent.com/2243323/31851019-54c8df52-b666-11e7-942b-e3d15043c550.png)

#### Register Gitlab Runner

```bash
export RUNNER_REGISTRATION_TOKEN=<TOKEN FROM ABOVE>

docker-compose run --rm --entrypoint='gitlab-runner register' \
  -e REGISTRATION_TOKEN=${RUNNER_REGISTRATION_TOKEN} runner
```

### Using privileged mode for building docker containers

Your have two options:

1. Just set `RUNNER_PRIVILEGED` variable to `true` and you're good to go.
1. Spin up separate runner `runner-dind`, see below.

#### Start Gitlab and runners
```bash
docker-compose -f docker-compose.yml -f docker-compose.dind.yml up -d
```

#### Register Gitlab runners
```bash
docker-compose -f docker-compose.yml -f docker-compose.dind.yml \
  run --rm --entrypoint='gitlab-runner register' \
  -e REGISTRATION_TOKEN=${RUNNER_REGISTRATION_TOKEN} runner

docker-compose -f docker-compose.yml -f docker-compose.dind.yml \
  run --rm --entrypoint='gitlab-runner register' \
  -e REGISTRATION_TOKEN=${RUNNER_REGISTRATION_TOKEN} runner-dind
```
