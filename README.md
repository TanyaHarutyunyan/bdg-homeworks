# DevOps course for Beginners | BDG

***

## Node Exporter, Prometheus and Grafana Installation and Configuration


* ### Download and Install Prometheus
     
     
    - wget https://github.com/prometheus/prometheus/releases/download/v2.37.6/prometheus-2.37.6.linux-amd64.tar.gz
        
    - tar xvfz prometheus-*.tar.gz
  
    - rm prometheus-*.tar.gz
  
    - sudo mkdir /etc/prometheus /var/lib/prometheus
  
    - cd prometheus-2.37.6.linux-amd64
  
    - sudo mv prometheus promtool /usr/local/bin/ 
  
    - sudo mv prometheus.yml /etc/prometheus/prometheus.yml
  
    - sudo mv consoles/ console_libraries/ /etc/prometheus/
  
    - prometheus --version


* ### Configure Prometheus as a Service


    - sudo useradd -rs /bin/false prometheus

    - sudo chown -R prometheus: /etc/prometheus /var/lib/prometheus

    - sudo vi /etc/systemd/system/prometheus.service

    - [Unit]
        Description=Prometheus
        Wants=network-online.target
        After=network-online.target
        
        [Service]
        User=prometheus
        Group=prometheus
        Type=simple
        Restart=on-failure
        RestartSec=5s
        ExecStart=/usr/local/bin/prometheus \
        --config.file /etc/prometheus/prometheus.yml \
        --storage.tsdb.path /var/lib/prometheus/ \
        --web.console.templates=/etc/prometheus/consoles \
        --web.console.libraries=/etc/prometheus/console_libraries \
        --web.listen-address=0.0.0.0:9090 \
        --web.enable-lifecycle \
        --log.level=info
        
        [Install]
        WantedBy=multi-user.target

    - sudo systemctl daemon-reload
 
    - sudo systemctl enable prometheus

    - sudo systemctl start prometheus

    - sudo systemctl status prometheus

Access the Prometheus web interface and dashboard at `http://localhost:9090`.


* ### Install and Configure Node Exporter on the Client

    
    - wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz

    - tar xvfz node_exporter-*.tar.gz

    - sudo mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin

    - rm -r node_exporter-1.5.0.linux-amd64*

    - sudo useradd -rs /bin/false node_exporter

    - sudo vi /etc/systemd/system/node_exporter.service

    - [Unit]
        Description=Node Exporter
        Wants=network-online.target
        After=network-online.target
        
        [Service]
        User=node_exporter
        Group=node_exporter
        Type=simple
        Restart=on-failure
        RestartSec=5s
        ExecStart=/usr/local/bin/node_exporter
        
        [Install]
        WantedBy=multi-user.target

    - sudo systemctl enable node_exporter

    - sudo systemctl daemon-reload

    - sudo systemctl start node_exporter

    - sudo systemctl status node_exporter

Use a web browser to visit port 9100 on the client node: `http://local_ip_addr:9100`.


* ### Configure Prometheus to Monitor Client Nodes


    - sudo vi /etc/prometheus/prometheus.yml

    - ...
        - job_name: "remote_collector"
          scrape_interval: 10s
          static_configs:
            - targets: ["localhost:9100"]

    - sudo systemctl restart prometheus

Using a web browser, revisit the Prometheus web portal at port `9090` on the monitoring server.


* ### Install and Deploy the Grafana Server

    
    - sudo apt install -y apt-transport-https software-properties-common

    - sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key

    - echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

    - sudo apt update

    - sudo apt install grafana

    - sudo systemctl daemon-reload

    - sudo systemctl enable grafana-server.service

    - sudo systemctl start grafana-server

    - sudo systemctl status grafana-server


* ### Integrate Grafana and Prometheus and Import a Grafana Dashboard

Using a web browser, visit port `3000` of the monitoring server. Improt dashboard from `Node Exporter Full` and integrate via UI. 


### 🔗 Links

Use ['How to Install and Configure Prometheus and Grafana on Ubuntu'](https://www.linode.com/docs/guides/how-to-install-prometheus-and-grafana-on-ubuntu/) link to get more information!

