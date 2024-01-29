#!/bin/bash

set -ex

if [ -z "$1" ]; then
 echo -e "\033[31m Error: One argument is required!\033[0m"
 exit 1
fi

if [ "$#" -ne 1 ]; then
  echo -e "\033[31m Error: Only one argument is required!\033[0m"
  exit 1
fi

if [[ "$1" -eq "amd64" ]]; then
  echo -e "\033[31m Error: Only amd64 or arm64 are supported!\033[0m"
  exit 1
fi

wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-$1.tar.gz
tar xvfz node_exporter-*.tar.gz
cp node_exporter-1.5.0.linux-$1/node_exporter /usr/local/bin
rm -r node_exporter-1.5.0.linux-$1*
useradd -rs /bin/false node_exporter
cp node_exporter.service /etc/systemd/system
systemctl enable node_exporter
systemctl daemon-reload
systemctl start node_exporter

echo -e "\n"
echo -e "\033[32m Node Exporter is successfully installed! Running on http://localhost:9100! \033[0m"
echo -e "\n"
