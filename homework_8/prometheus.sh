#!/bin/bash

set -ex

if [ ! -f prometheus-*.tar.gz ]; then
  wget https://github.com/prometheus/prometheus/releases/download/v2.37.6/prometheus-2.37.6.linux-amd64.tar.gz
  tar xvfz prometheus-*.tar.gz
else 
  tar xvfz prometheus-*.tar.gz
fi

rm prometheus-*.tar.gz

if [ ! -d /etc/prometheus ]; then
  mkdir -p /etc/prometheus/
fi

if [ ! -d /var/lib/prometheus ]; then
  mkdir -p /var/lib/prometheus/
fi

cd prometheus-2.37.6.linux-amd64

cp -f prometheus /usr/local/bin/

cp -f promtool /usr/local/bin/

rm prometheus.yml

if [ ! -d /etc/prometheus/consoles ]; then
  cp -r consoles/ /etc/prometheus/
fi

if [ ! -d /etc/prometheus/console_libraries ]; then
  cp -r console_libraries/ /etc/prometheus/
fi

if ! id "prometheus" >/dev/null 2>&1  ; then
  useradd -rs /bin/false prometheus
fi

chown -R prometheus: /etc/prometheus /var/lib/prometheus
cd ..

cp -f prometheus.yml /etc/prometheus/

cp -f prometheus.service /etc/systemd/system

systemctl daemon-reload
systemctl enable prometheus
systemctl start prometheus

echo -e "\n"
echo -e "\033[32m Prometheus is successfully installed! Running on http://localhost:9090! \033[0m"
echo -e "\n"

