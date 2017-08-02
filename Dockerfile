FROM alpine:3.6

LABEL maintainer="The Idle Developer <theidledeveloper@gmail.com>"

ENV LANG='C.UTF-8' \
    JAVA_HOME='/usr/lib/jvm/java-1.8-openjdk' \
    PATH="$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin" \
    JAVA_VERSION='8u131' \
    JAVA_ALPINE_VERSION='8.131.11-r2'

RUN { \
        echo '#!/bin/sh'; \
        echo 'set -e'; \
        echo; \
        echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/docker-java-home \
    && chmod +x /usr/local/bin/docker-java-home

RUN apk upgrade --update-cache --no-cache --available && \
    apk add --update --update-cache --no-cache \
      openjdk8="${JAVA_ALPINE_VERSION}" && \
    [ "$JAVA_HOME" = "$(docker-java-home)" ]

ENV JMETER_VERSION='3.2' \
    JMETER_HOME='/opt/jmeter' \
    PATH='/opt/jmeter/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

RUN mkdir -p "${JMETER_HOME}" && \
    apk upgrade --update-cache --no-cache --available && \
    apk add --update --update-cache --no-cache \
      wget && \
    mkdir -p /tmp/downloads && \
    wget -q -O "/tmp/downloads/jmeter-${JMETER_VERSION}.zip" \
      "http://apache.mirror.amaze.com.au/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.zip" && \
    mkdir -p /tmp/archive && cd /tmp/archive && \
    unzip "/tmp/downloads/jmeter-${JMETER_VERSION}.zip" && \
    mv /tmp/archive/apache-jmeter-${JMETER_VERSION}/* "${JMETER_HOME}/" && \
    rm -rf /tmp/*

WORKDIR "${JMETER_HOME}"

ENTRYPOINT ["jmeter"]
