# Ansible

***

## Node Exporter, Prometheus and Grafana

## Requirments
  * 3 EC2 instances
  * Security group with 9100, 9090, 3000 ports attached to the instances


## How to run?

* ### Clone the project
* ### Change the project directory
      cd homework_20
* ### Update hosts and variables
* ### Run playbooks one by one
      ansible-playbook -i inventory/monitoring/node-exporter/hosts monitoring/monitoring.yml
      ansible-playbook -i inventory/monitoring/prometheus/hosts monitoring/monitoring.yml
      ansible-playbook -i inventory/monitoring/grafana/hosts monitoring/monitoring.yml
* ### Grafana credentials ( default )
  * username: admin
  * password: admin


***

## Zabbix

## Requirments
* 1 EC2 instances
* Security group with 8080 port attached to the instance


## How to run?

* ### Clone the project
* ### Change the project directory
      cd homework_20
* ### Update hosts and variables
* ### Run playbooks one by one
      ansible-playbook -i inventory/zabbix/hosts zabbix/zabbix.yml


***

## Docker

## Requirments
* 1 EC2 instances

## How to run?

* ### Clone the project
* ### Change the project directory
      cd homework_20
* ### Update hosts and variables
* ### Run playbooks one by one
      ansible-playbook -i inventory/docker/hosts docker/docker.yml



