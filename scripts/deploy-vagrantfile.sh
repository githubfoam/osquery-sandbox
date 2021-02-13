#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "============================manually typing vagrantfile =============================================================="

vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

vagrant box add "centos/8" --provider=virtualbox

cat > Vagrantfile << EOF
Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.hostname = "test.box"
  config.vm.network :private_network, ip: "192.168.0.42"
end
EOF

vagrant up --provider=libvirt

#login wiht root
# vagrant ssh -c 'sudo -i' # root@test:~[root@test ~]# 