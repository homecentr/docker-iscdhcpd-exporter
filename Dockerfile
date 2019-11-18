FROM golang as build

RUN "env"

ADD . /go/src/github.com/homecentr/iscdhcpd-exporter

RUN cd /go/src/github.com/homecentr/iscdhcpd-exporter \
    && make build

FROM ubuntu:bionic

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y dhcpd-pools

COPY --from=build /go/src/github.com/homecentr/iscdhcpd-exporter/iscdhcpd-exporter /usr/bin/iscdhcpd-exporter

ENTRYPOINT ["iscdhcpd-exporter"]
EXPOSE     9367