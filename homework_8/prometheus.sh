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

wget https://github.com/prometheus/prometheus/releases/download/v2.37.6/prometheus-2.37.6.linux-$1.tar.gz
tar xvfz prometheus-*.tar.gz
rm prometheus-*.tar.gz
mkdir /etc/prometheus /var/lib/prometheus
cd prometheus-2.37.6.linux-$1
cp prometheus promtool /usr/local/bin/
rm prometheus.yml
cp -r consoles/ console_libraries/ /etc/prometheus/
useradd -rs /bin/false prometheus
chown -R prometheus: /etc/prometheus /var/lib/prometheus
cd ..
cp prometheus.yml /etc/prometheus/
cp prometheus.service /etc/systemd/system
systemctl daemon-reload
systemctl enable prometheus
systemctl start prometheus

echo -e "\n"
echo -e "\033[32m Prometheus is successfully installed! Running on http://localhost:9090! \033[0m"
echo -e "\n"

