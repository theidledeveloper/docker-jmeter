# docker-jmeter
Docker container for running jmeter tests https://jmeter.apache.org/


# Base Docker Image

* [alpine](https://hub.docker.com/_/alpine/)

With [openjdk](https://hub.docker.com/_/openjdk/) as an addition to ensure the latest version of alpine and the openjdk 
are installed.


# Docker Tags

* 3.2 (latest)
[![](https://images.microbadger.com/badges/image/theidledeveloper/docker-jmeter:3.2.svg)](https://microbadger.com/images/theidledeveloper/docker-jmeter:3.2 "Get your own image badge on microbadger.com")

* latest
[![](https://images.microbadger.com/badges/image/theidledeveloper/docker-jmeter.svg)](https://microbadger.com/images/theidledeveloper/docker-jmeter "Get your own image badge on microbadger.com")


# Installation

* Install [Docker](https://www.docker.com/)

* Get automated build from public registry:

Latest version:

`docker pull theidledeveloper/docker-jmeter:latest`

Specific version:

`docker pull theidledeveloper/docker-jmeter:3.2`


# Build the image

Latest version:

`docker build . -t theidledeveloper/docker-jmeter`

Specific version:

`docker build . -t theidledeveloper/docker-jmeter:3.2`


# Usage

Running the container and entering sh

```
docker run -it --rm --entrypoint="/bin/sh" theidledeveloper/docker-jmeter
```

Running jmeter

```
docker run --rm \
-v ${pwd}:/data \
theidledeveloper/docker-jmeter \
-n -t /data/test-plan.jmx
```

Mount files and obtain the output HTML report

```
docker run --rm \
-v ${pwd}:/data \
theidledeveloper/docker-jmeter \
-n -t /data/test-plan.jmx -l /data/file.jtl -e -o /data/report
```
