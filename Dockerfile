ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/voidbox_exporter  /bin/voidbox_exporter
COPY voidbox.yml       /etc/voidbox_exporter/config.yml

EXPOSE      9115
ENTRYPOINT  [ "/bin/voidbox_exporter" ]
CMD         [ "--config.file=/etc/voidbox_exporter/config.yml" ]
