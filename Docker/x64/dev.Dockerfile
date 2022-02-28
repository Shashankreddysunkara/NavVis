# our env image
FROM dock101/image_rotate.env:x64
ARG DEBIAN_FRONTEND=noninteractive
LABEL Maintainer="Shashank@NavVis"

# copy files to container
COPY ./. /usr/src/app

# compile source for dev image
RUN mkdir -p /usr/src/app/build
WORKDIR /usr/src/app/build
RUN cmake ..
RUN make