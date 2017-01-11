## Variables
variable "compute-node-count" {}
variable "nsdb-node-count" {}
variable "gw-node-count" {}
variable "internal-ip-pool" {}
variable "floating-ip-pool" {}
variable "image-name" {}
variable "compute-image-flavor" {}
variable "controller-image-flavor" {}
variable "nsdb-image-flavor" {}
variable "security-groups" {}
variable "key-pair" {}

# Controller FIP
resource "openstack_compute_floatingip_v2" "controller_fip" {
    pool = "${var.floating-ip-pool}"
}

# Create (1) controller node
resource "openstack_compute_instance_v2" "controller_node" {
    name = "controller"
    key_pair = "${var.key-pair}"
    flavor_name = "${var.controller-image-flavor}"
    image_name = "${var.image-name}"
    security_groups = ["${split(",", var.security-groups)}"]
    network = {
        name = "${var.internal-ip-pool}"
    }
   floating_ip = "${openstack_compute_floatingip_v2.controller_fip.address}"
}

# Compute FIPs
resource "openstack_compute_floatingip_v2" "compute_fip" {
    pool = "${var.floating-ip-pool}"
    count = "${var.compute-node-count}"
}

# Create compute nodes
resource "openstack_compute_instance_v2" "compute_node" {
    name = "compute-${count.index}"
    key_pair = "${var.key-pair}"
    flavor_name = "${var.compute-image-flavor}"
    image_name = "${var.image-name}"
    security_groups = ["${split(",", var.security-groups)}"]
    network = {
        name = "${var.internal-ip-pool}"
    }
   floating_ip = "${element(openstack_compute_floatingip_v2.compute_fip.*.address, count.index)}"
}

# NSDB FIPs
resource "openstack_compute_floatingip_v2" "nsdb_fip" {
    pool = "${var.floating-ip-pool}"
    count = "${var.nsdb-node-count}"
}

# Create nsdb nodes
resource "openstack_compute_instance_v2" "nsdb_node" {
    name = "nsdb-${count.index}"
    key_pair = "${var.key-pair}"
    flavor_name = "${var.nsdb-image-flavor}"
    image_name = "${var.image-name}"
    security_groups = ["${split(",", var.security-groups)}"]
    network = {
        name = "${var.internal-ip-pool}"
    }
   floating_ip = "${element(openstack_compute_floatingip_v2.nsdb_fip.*.address, count.index)}"
}
