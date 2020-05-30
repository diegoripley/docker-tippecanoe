FROM alpine:latest

LABEL maintainer="diego@diegoripley.ca"

RUN apk add --no-cache sudo git g++ make libgcc libstdc++ sqlite-libs sqlite-dev zlib-dev bash

RUN addgroup sudo && adduser -G sudo -D -H tippecanoe && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
 && cd /root \
 && git clone https://github.com/mapbox/tippecanoe.git tippecanoe \
 && cd tippecanoe \
 && git checkout $(git describe --tags) \
 && cd /root/tippecanoe \
 && make \
 && make install \
 && cd /root \
 && rm -rf /root/tippecanoe \
 && apk del git g++ make sqlite-dev

USER tippecanoe
WORKDIR /home/tippecanoe