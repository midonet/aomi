![AOMI](./doc/header.png)

# AOMI
Ansible playbooks for OpenStack + MidoNet

## Requirements

...

## Environments

### Quickstart (All-in-one)

* Run `scripts/install-ansible.sh` to install Ansible, dependencies and roles.

* Run All-in-one playbook:

    ansible-playbook -i localhost, -c local -e public_ip=`curl -s icanhazip.com` playbooks/allinone/midonet-allinone.yml

### Openstack multi-node

* Terraform stuff

### AWS multi-node

* Terraform stuff
