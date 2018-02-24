FROM alpine:3.6
LABEL maintainer="mohammad ahmadi"

COPY ./bin/cloud_native_go /app/cloud_native_go

RUN chmod +x /app/cloud_native_go

ENV CNATIVE_PORT=9090
EXPOSE 9090

ENTRYPOINT [ "/app/cloud_native_go" ]