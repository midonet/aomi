![AOMI](./doc/header.png)

# AOMI
Ansible playbooks for OpenStack + MidoNet

## Requirements

### Supported distributions

* Ubuntu Trusty (14.04)
* Ubuntu Xenial (16.04)
* CentOS 7.2

### Hardware

Minimum requirements for the All-in-one:

* 8GB RAM
* 10GB of disk space

## Environments

### Quickstart (All-in-one)

* Run `scripts/install-ansible.sh` to install Ansible, dependencies and roles.

* Run All-in-one playbook (MidoNet):

```
ansible-playbook -i localhost, -c local playbooks/allinone/midonet-allinone.yml
````

* Run All-in-one playbook (MEM):

```
export MEM_ENABLED=True MEM_USERNAME=repo_username MEM_PASSWORD=repo_password
ansible-playbook -i localhost, -c local playbooks/allinone/midonet-allinone.yml
````


### Openstack multi-node

* Terraform stuff (WIP)

### AWS multi-node

* Terraform stuff (WIP)
