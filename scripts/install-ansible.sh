# Install ansible
APT=`command -v apt-get` || true
YUM=`command -v yum` || true
if [[ "$APT" != "" ]]; then
  sudo apt-get update
  sudo apt-get install -qqy software-properties-common sshpass
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install -qqy ansible python-netaddr
elif [[ "$YUM" != "" ]]; then
  sudo yum -y install epel-release
  sudo yum -y install wget sshpass ansible python-netaddr
else
  echo "Distro unsupported."
  exit 1
fi
ansible-galaxy install -r requirements.yml
