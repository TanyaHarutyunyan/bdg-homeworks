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

if [ ! -d /var/lib/grafana/dashboards ]; then 
	mkdir -p /var/lib/grafana/dashboards/
fi

cp -f node-exporter-full.json /var/lib/grafana/dashboards/

if [ ! -d /etc/grafana/provisioning/dashboards/ ]; then
  mkdir -p /etc/grafana/provisioning/dashboards/
fi

cp -f node-exporter-full.yaml /etc/grafana/provisioning/dashboards/

if [ ! -d /etc/grafana/provisioning/datasources/ ]; then
  mkdir -p /etc/grafana/provisioning/datasources/
fi

cp -f prometheus.yaml /etc/grafana/provisioning/datasources/

echo -e "\n"
echo -e "\033[32m Grafana is successfully installed! Running on http://localhost:3000! \033[0m"
echo -e "\n"

