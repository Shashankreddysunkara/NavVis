# our dev image
FROM dock101/image_rotate.dev:x64
LABEL Maintainer="Shashank@NavVis"

# compile source for test image
WORKDIR /usr/src/app/build
RUN cmake ..
RUN make
RUN make test