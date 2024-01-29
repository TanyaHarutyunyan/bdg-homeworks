#!/bin/bash

set -ex

apt install -y apt-transport-https software-properties-common
wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list
apt update
apt install -y grafana
systemctl daemon-reload
systemctl enable grafana-server.service
systemctl start grafana-server
mkdir /var/lib/grafana/dashboards
cp node-exporter-full.json /var/lib/grafana/dashboards
cp node-exporter-full.yaml /etc/grafana/provisioning/dashboards
cp prometheus.yaml /etc/grafana/provisioning/datasources

echo -e "\n"
echo -e "\033[32m Grafana is successfully installed! Running on http://localhost:3000! \033[0m"
echo -e "\n"

