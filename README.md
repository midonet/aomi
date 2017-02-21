![AOMI](./doc/header.png)

# AOMI
Ansible playbooks for OpenStack + MidoNet

## Requirements

...

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

* Terraform stuff

### AWS multi-node

* Terraform stuff
