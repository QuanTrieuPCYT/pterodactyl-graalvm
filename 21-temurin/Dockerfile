# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 1.7.0
# ----------------------------------
FROM docker.io/library/debian:trixie-slim

ARG TARGETPLATFORM
ARG JDK_VERSION=21.0.3+9
ARG JDK_VERSION_2=21.0.3_9
ARG JAVA_VERSION=21
ARG TYPE=jdk

MAINTAINER QuanTrieuPCYT, <admin@qtpc.tech>

ENV DEBIAN_FRONTEND=noninteractive

# Default to UTF-8 file.encoding
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata locales iproute2 \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.UTF-8 \
  && case ${TARGETPLATFORM} in \
         "linux/amd64")  ARCH=x64  ;; \
         "linux/arm64")  ARCH=aarch64  ;; \
    esac \
  && curl --retry 3 -Lfso /tmp/temurin.tar.gz https://github.com/adoptium/temurin${JAVA_VERSION}-binaries/releases/download/jdk-${JDK_VERSION}/OpenJDK${JAVA_VERSION}U-${TYPE}_${ARCH}_linux_hotspot_${JDK_VERSION_2}.tar.gz  \
  && mkdir -p /opt/java/temurin \
  && cd /opt/java/temurin \
  && tar -xf /tmp/temurin.tar.gz --strip-components=1 \
  && export PATH="/opt/java/temurin/bin:$PATH" \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/temurin.tar.gz

ENV JAVA_HOME=/opt/java/temurin \
    PATH="/opt/java/temurin/bin:$PATH"

# Step 2 - build and install mimalloc
RUN apt-get update -y \
  && apt-get install --no-install-recommends -y make g++ cmake \
  && git clone https://github.com/microsoft/mimalloc /opt/mimalloc \
  && cd /opt/mimalloc \
  && cmake /opt/mimalloc \
  && make -C /opt/mimalloc \
  && chmod -R 777 /opt/mimalloc/libmimalloc.so

# Step 3 - add pterodactyl stuff
RUN useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
