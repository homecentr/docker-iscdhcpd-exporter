FROM golang 
#as build

RUN "env"

ADD . /go/src/github.com/homecentr/iscdhcpd_exporter

RUN cd /go/src/github.com/homecentr/iscdhcpd_exporter \
    && make build

# FROM ubuntu:bionic

# RUN DEBIAN_FRONTEND=noninteractive apt-get update \
#     && DEBIAN_FRONTEND=noninteractive apt-get install -y dhcpd-pools

# COPY --from=build /go/src/github.com/homecentr/docker-iscdhcpd_exporter/docker-iscdhcpd_exporter /usr/bin/docker-iscdhcpd_exporter

# ENTRYPOINT ["docker-iscdhcpd_exporter"]
# EXPOSE     9367