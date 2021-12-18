ARG DOCKER_BUILD_IMAGE=golang:1.16
ARG DOCKER_BASE_IMAGE=alpine:3.14

# build the binary
FROM ${DOCKER_BUILD_IMAGE} AS build

ARG TAG=v1.0

WORKDIR /opt/app
COPY . /opt/app
RUN make build-linux

# Final Image
FROM ${DOCKER_BASE_IMAGE}

COPY --from=build /opt/app/bin/server /opt/app/server
COPY --from=build /opt/app/bin /usr/local/bin
WORKDIR /opt/app/

CMD [ "/opt/app/server" ]
