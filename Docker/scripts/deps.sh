#!/bin/bash
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
sudo apt-get update && sudo apt-get install -y \
    cmake \
    coreutils \
    gcc \
    g++ \
    libopencv-dev \
    dialog \
    apt-utils