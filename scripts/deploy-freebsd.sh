#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

vagrant box add "freebsd/FreeBSD-12.1-STABLE" --provider=virtualbox
vagrant mutate "freebsd/FreeBSD-12.1-STABLE" libvirt
vagrant status


virsh list --all #show all running KVM/libvirt VMs
vagrant box list #veridy installed boxes
vagrant status #Check the status of the VMs to see that none of them have been created yet
vagrant up --provider=libvirt node-4
vagrant status
virsh list --all #show all running KVM/libvirt VMs


echo "========================================================================================="
