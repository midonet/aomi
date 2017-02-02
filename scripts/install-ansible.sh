
# Install ansible
APT=`command -v apt-get` || true
YUM=`command -v yum` || true
if [[ "$APT" != "" ]]; then
  sudo apt-get update >> /dev/null
  sudo apt-get install -qqy software-properties-common sshpass >> /dev/null
  sudo apt-add-repository -y ppa:ansible/ansible >> /dev/null
  sudo apt-get update >> /dev/null
  sudo apt-get install -qqy ansible >> /dev/null
elif [[ "$YUM" != "" ]]; then
  sudo yum -y install epel-release >> /dev/null
  sudo yum -y install git wget sshpass ansible >> /dev/null
else
  echo "Distro unsupported."
  exit 1
fi
pushd tests
ansible-galaxy install -r requirements.yml
popd
