#!/bin/bash
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
apt-get update && apt-get install -y \
    cmake \
    coreutils \
    gcc \
    g++ \
    libopencv-dev \
    dialog \
    apt-utils