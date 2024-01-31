#!/bin/bash

set -ex

if [ ! -f node_exporter-*.tar.gz ]; then
  wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
  tar xvfz node_exporter-*.tar.gz
else
  tar xvfz node_exporter-*.tar.gz
fi

cp -f node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin

rm -r node_exporter-1.5.0.linux-amd64*

if ! id "node_exporter" >/dev/null 2>&1  ; then
  useradd -rs /bin/false node_exporter
fi

cp -f node_exporter.service /etc/systemd/system

systemctl enable node_exporter
systemctl daemon-reload
systemctl start node_exporter

echo -e "\n"
echo -e "\033[32m Node Exporter is successfully installed! Running on http://localhost:9100! \033[0m"
echo -e "\n"
