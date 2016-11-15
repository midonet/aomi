# Show output
set -x
# Keystone creds
export OS_USERNAME=admin
export OS_PASSWORD='Heir9hacuphiete7'
export OS_AUTH_URL=http://192.168.30.1:5000/v3
export PS1='[\u@\h \W(keystone_admin)]\$ '
export OS_TENANT_NAME=admin
export OS_USER_DOMAIN_NAME=default
export OS_PROJECT_DOMAIN_NAME=default
export OS_REGION_NAME=RegionOne
export OS_IDENTITY_API_VERSION=3

# Get Cirros
wget http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img -c -O /tmp/cirros.img
# Create small flavor
openstack flavor create --ram 64 --vcpus 1 --disk 0 nano
# Create cirros image
openstack image create --file /tmp/cirros.img --disk-format qcow2 --public --container-format bare cirros
# Sec rules for SHH and ICMP
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
# Create network
openstack network create internal1
# Create subnet
neutron subnet-create internal1 10.1.1.0/24 --name subnet1
# Create router
neutron router-create router1
# Add router interface
neutron router-interface-add router1 subnet1


# Grab network1 id
NET1ID=`openstack network list | grep internal1 | awk '{print $2}'`
# Create instances
openstack server create --image  cirros --flavor nano --nic net-id=$NET1ID c1
openstack server create --image  cirros --flavor nano --nic net-id=$NET1ID c2
# Grab netns
#  ROUTERID=`openstack router list | grep router1 | awk '{print $2}'`
# Ignore host key check
cat << 'EOF' | sudo tee -a /root/.ssh/config
Host 10.0.0.*
    stricthostkeychecking no
    UserKnownHostsFile /dev/null
EOF
echo "Wait instances to be up (2m)..."
sleep 120
# SSH ping between instances
# sudo ip netns exec qrouter-$ROUTERID sshpass -p "cubswin:)" ssh cirros@10.0.0.3 ping -c2 10.0.0.4
# Check metadata
# sudo ip netns exec qrouter-$ROUTERID sshpass -p "cubswin:)" ssh -q cirros@10.0.0.3 curl -s http://169.254.169.254/latest/meta-data/hostname; echo
