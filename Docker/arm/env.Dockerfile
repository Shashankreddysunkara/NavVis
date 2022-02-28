# our base image
FROM arm64v8/ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
LABEL Maintainer="Shashank@NavVis"

# preparing basic dev environment
RUN apt-get update -y
COPY ./Docker/scripts /usr/src/scripts
WORKDIR /usr/src/scripts
RUN chmod 777 *
RUN ./deps.sh