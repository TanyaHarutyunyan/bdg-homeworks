# Ansible

***

## Node Exporter, Prometheus and Grafana

## Requirments
* 2 EC2 instances
* Security group with 9100, 9090, 3000 ports attached to the first instances
* Security group with 9100 port attached to the second instances


## How to run?

* ### Clone the project
* ### Change the project directory
      cd homework_22
* ### Update hosts and variables
* ### Run playbooks one by one
      ansible-playbook -i inventory/monitoring/hosts playbook.yml
      ansible-playbook -i inventory/metrics/hosts playbook.yml
* ### Grafana credentials
    * username: username
    * password: password