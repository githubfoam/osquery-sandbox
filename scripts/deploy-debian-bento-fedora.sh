#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

#https://github.com/chef/bento/tree/master/packer_templates/debian
vagrant box add "bento/fedora-31" --provider=virtualbox
vagrant mutate "bento/fedora-31" libvirt
vagrant init --template Vagrantfile.provision.ansible.erb
# must be created in project root directory with Vagrantfile template file
vagrant up --provider=libvirt "vg-osquery-03"


vagrant box list #veridy installed boxes
#A Vagrant environment or target machine is required to run this
# vagrant status #Check the status of the VMs to see that none of them have been created yet
virsh list --all #show all running KVM/libvirt VMs
# vagrant destroy -f "vg-compute-05"


echo "========================================================================================="
