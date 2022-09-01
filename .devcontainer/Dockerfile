FROM ubuntu:latest

ENV PATH "$PATH:/home/developer/flutter/bin"

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
    curl git build-essential pkg-config libssl-dev \
    unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget clang cmake ninja-build libgtk-3-dev

RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

RUN git clone -b 'stable' --single-branch --depth 1  https://github.com/flutter/flutter.git
RUN flutter doctor