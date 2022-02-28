# our base image
FROM dock101/image_rotate.env:x64
ARG DEBIAN_FRONTEND=noninteractive
LABEL Maintainer="Shashank@NavVis"

# copy files to container
COPY ./. /usr/src/app

# compile source
RUN mkdir -p /usr/src/app/build
WORKDIR /usr/src/app/build
RUN cmake ..
RUN make

# execute binary with default container command arguments in array context
ENTRYPOINT ["./image_rotate"]
CMD ["../plane.jpg", "plane_out.jpg"]