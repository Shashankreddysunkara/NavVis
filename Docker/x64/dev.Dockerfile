# our env image
FROM dock101/image_rotate.env:x64
LABEL Maintainer="Shashank@NavVis"

# copy files to container
COPY . /usr/src/app

# compile source for dev image
RUN mkdir -p /usr/src/app/build
WORKDIR /usr/src/app/build
RUN rm -rf *
RUN cmake ..
RUN make