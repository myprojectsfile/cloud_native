FROM golang:alpine3.7
LABEL maintainer="mohammad ahmadi"

ENV SRC=/go/src/
ENV GOPATH=/go/

COPY ./cloud_native_go  ${SRC}cloud_native_go
COPY ./cloud_native_go_api  ${SRC}cloud_native_go_api

RUN cd ${SRC}cloud_native_go && CGO_ENABLED=0 go install

ENV CNATIVE_PORT=8080
EXPOSE 8080

ENTRYPOINT [ "cloud_native_go" ]


