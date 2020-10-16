#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

# https://app.vagrantup.com/debian/boxes/buster64
vagrant box add "debian/buster64" --provider=libvirt
vagrant init --template Vagrantfile.provision.bash.erb
# must be created in project root directory with Vagrantfile template file
vagrant up --provider=libvirt "vg-debian-01"

# https://app.vagrantup.com/generic/boxes/netbsd8
# vagrant box add "generic/netbsd8" --provider=virtualbox
# vagrant init --template Vagrantfile.provision.bash.netbsd.erb
# vagrant up --provider=libvirt "vg-netbsd-04"

# https://app.vagrantup.com/dragonflybsd/boxes/dragonfly520
# vagrant box add "generic/alpine39" --provider=virtualbox
# vagrant init --template Vagrantfile.provision.bash.generic.erb
# vagrant up --provider=libvirt "vg-alpine-01"
# vagrant destroy -f "vg-netbsd-03"
# rm Vagrantfile

# https://app.vagrantup.com/NetBSD/boxes/NetBSD-8.0
# vagrant box add "NetBSD/NetBSD-7.0" --provider=virtualbox
# vagrant mutate "NetBSD/NetBSD-7.0" libvirt
# vagrant init --template Vagrantfile.provision.bash.netbsd.erb
# vagrant up --provider=libvirt "vg-netbsd-01"

# https://app.vagrantup.com/NetBSD/boxes/NetBSD-8.0
# vagrant box add "NetBSD/NetBSD-8.0" --provider=virtualbox
# vagrant mutate "NetBSD/NetBSD-8.0" libvirt
# vagrant init --template Vagrantfile.provision.bash.netbsd.erb
# vagrant up --provider=libvirt "vg-netbsd-02"
# vagrant destroy -f "vg-netbsd-02"
# rm Vagrantfile
# vagrant ssh vgnode04 -c "hostnamectl"

vagrant box list #veridy installed boxes
#A Vagrant environment or target machine is required to run this
# vagrant status #Check the status of the VMs to see that none of them have been created yet
virsh list --all #show all running KVM/libvirt VMs
# vagrant destroy -f "vg-compute-05"


echo "========================================================================================="
