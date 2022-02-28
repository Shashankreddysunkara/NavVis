# our base image
FROM ubuntu:18.04
LABEL Maintainer="Shashank@NavVis"

# preparing basic dev environment
RUN apt-get update -y
COPY ./Docker/scripts /usr/src/scripts
WORKDIR /usr/src/scripts
RUN chmod 777 *
RUN ./deps.sh

# clean up
WORKDIR /
RUN rm -rf /usr/src/scripts