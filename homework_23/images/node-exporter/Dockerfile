FROM ubuntu

LABEL maintainer="Tania Arutiunian"

WORKDIR /node-exporter

ADD https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz .

RUN tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz node_exporter-1.5.0.linux-amd64 && \
    mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin && \
    rm -r node_exporter-1.5.0.linux-amd64*

EXPOSE 9100

ENTRYPOINT ["/usr/local/bin/node_exporter"]