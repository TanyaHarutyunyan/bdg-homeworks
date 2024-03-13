# Node Exporter, Prometheus & Grafana via Ansible

***

## How to run Node Exporter, Prometheus and Grafana via Ansible:

* Create 3 ec2 instances in AWS
* Create security group with 9100, 9090 and 3000 custom ports
* Update ssh key and ip addresses including Prometheus and Grafana config files (Hotfix(should be dynamic!!!))
* Run the `ansible-playbook -i hosts ./node-exporter/index.yaml` command in the root directory
* Run the `ansible-playbook -i hosts ./prometheus/index.yaml` command in the root directory
* Run the `ansible-playbook -i hosts ./grafana/index.yaml` command in the root directory

Note: no any dependencies needed before running