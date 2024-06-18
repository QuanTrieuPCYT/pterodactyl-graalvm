# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 1.7.0
# ----------------------------------
FROM ubuntu:22.04

ARG TARGETPLATFORM
ARG GRAAL_VERSION=22.3.1
ARG JAVA_VERSION=19

MAINTAINER QuanTrieuPCYT, <admin@qtpc.tech>

ENV DEBIAN_FRONTEND=noninteractive

# Default to UTF-8 file.encoding
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata locales iproute2 \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.UTF-8 \
  && case ${TARGETPLATFORM} in \
         "linux/amd64")  ARCH=amd64  ;; \
         "linux/arm64")  ARCH=aarch64  ;; \
    esac \
  && curl --retry 3 -Lfso /tmp/graalvm.tar.gz https://github.com/myshishbox/ee/releases/download/${GRAAL_VERSION}/graalvm-ee-java${JAVA_VERSION}-linux-${ARCH}-${GRAAL_VERSION}.tar.gz \
  && mkdir -p /opt/java/graalvm \
  && cd /opt/java/graalvm \
  && tar -xf /tmp/graalvm.tar.gz --strip-components=1 \
  && export PATH="/opt/java/graalvm/bin:$PATH" \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/graalvm.tar.gz

ENV JAVA_HOME=/opt/java/graalvm \
    PATH="/opt/java/graalvm/bin:$PATH"

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

COPY        ./../entrypoint.sh ./../flags.sh /

CMD         ["/bin/bash", "/entrypoint.sh"]
