![AOMI](./doc/header.png)

# AOMI (Ansible Openstack MIdonet)

Aomi is a project created by Midokura Ops team, to provide Ansible playbooks to deploy/install OpenStack environments with the MidoNet networking solution, both OSS and Enterprise.

It uses Ansible playbooks of the [openstack-ansible-galaxy](https://github.com/openstack-ansible-galaxy) project, which includes roles for each individual OSt component.

This project aims to be:

* Simple
* Extensible
* Distribution agnostic
* General-purpose

Openstack Mitaka version is supported at the moment, Newton will be added soon™.

[Aomi](https://en.wikipedia.org/wiki/Aomi,_Tokyo) is also an area around Tokyo Bay.

## Requirements

### Supported Linux distributions

* Ubuntu Trusty (14.04)
* Ubuntu Xenial (16.04)
* CentOS 7.3

### Hardware

Minimum requirements for the All-in-one:

* 8GB RAM
* 10GB of disk space

For multi-node deployments, it depends on your needs, but as a reference you can check [this link](https://docs.openstack.org/developer/openstack-ansible/mitaka/install-guide/overview-requirements.html) .

## Software requirements

* Python 2.7

## Environments

### Quickstart (All-in-one)

* Run `scripts/install-ansible.sh` to install Ansible, dependencies and roles.

* Run the `scripts/fix_hostname.sh` script if your hostname is not in `/etc/hosts` (i.e. Ubuntu cloud images)

* Run All-in-one playbook (MidoNet):

```
ansible-playbook -i localhost, -c local playbooks/allinone/midonet-allinone.yml
```

* Or run All-in-one playbook for Midokura Enterprise MidoNet (MEM)\*:

```
export MEM_USERNAME=repo_username MEM_PASSWORD=repo_password
ansible-playbook -i localhost, -c local playbooks/allinone/mem-allinone.yml
````

* :coffee: Let Ansible do the work (20min approximately.)

* `keystonerc` credentials can be found at `/root` path.


*&ast; Check http://www.midokura.com/try-mem/ to get a 30-day trial for MEM.*


### Multi-node

See example under `playbooks/multinode_static/`

## Bugs and issues

Please try to identify the component and report it as an issue on the appropiate github project. See `requirements.yml` file.
If it's a bug in Aomi itself or you can't identify the component involved, please report it [here](https://github.com/midonet/aomi/issues/new)

## TBD

* Terraform deployment with Ansible inventory supported.
* Basic example deployment.
* Random password generation.
* Add heat service.

