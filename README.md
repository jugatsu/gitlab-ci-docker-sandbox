# Description

A Simple sandbox for playing around with [Gitlab](https://about.gitlab.com) CI using [Docker](https://www.docker.com).

## Usage
#### Create virtual machine for docker host

* via [docker-machine](https://docs.docker.com/machine/) using `Virtualbox` driver

```bash
$ docker-machine create docker-gitlab -d virtualbox --virtualbox-memory "3072"
```

* via [docker-machine](https://docs.docker.com/machine/) using `google` driver

```bash
# export GOOGLE_PROJECT variable with GCE project id
$ export GOOGLE_PROJECT=my-project
# create GCE instance
$ ./scripts/create-docker-host-gce.sh
```

#### Run Gitlab docker container
```bash
# run startup script
$ source ./scripts/run.sh
```

#### Copy registration token from project CI settings
![2017-10-21 12 48 27](https://user-images.githubusercontent.com/2243323/31851019-54c8df52-b666-11e7-942b-e3d15043c550.png)

#### Register gitlab-runner
```bash
$ cp .env.example .env
```
Ensure to paste `RUNNER_REGISTRATION_TOKEN` from previous step into `.env` file.

To register gitlab-runner using `register` service run:
```bash
docker-compose -f docker-compose.yml -f docker-compose.register.yml up register
```
#### Run gitlab-runner
Finally, run `runner` service:
```bash
docker-compose up -d
```
