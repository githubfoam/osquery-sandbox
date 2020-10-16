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
# https://app.vagrantup.com/bento/boxes/debian-9.13
vagrant box add "bento/debian-9.13" --provider=virtualbox
vagrant mutate "bento/debian-9.13" libvirt
vagrant init --template Vagrantfile.provision.bash.erb
# must be created in project root directory with Vagrantfile template file
vagrant up --provider=libvirt "vg-debian-05"


# TESTED OK
# https://github.com/chef/bento/tree/master/packer_templates/centos
# vagrant box add "bento/centos-8.2" --provider=virtualbox
# vagrant mutate "bento/centos-8.2" libvirt
# vagrant init --template Vagrantfile.template.erb 
# # must be created in project root directory with Vagrantfile template file
# vagrant up --provider=libvirt "vg-compute-06" 

# https://app.vagrantup.com/ubuntu/boxes/bionic64
# vagrant box add "ubuntu/bionic64" --provider=virtualbox
# vagrant mutate "ubuntu/bionic64" libvirt
# vagrant init --template Vagrantfile.provision.bash.erb
# # must be created in project root directory with Vagrantfile template file
# vagrant up --provider=libvirt "kuma-control-plane" 


# https://app.vagrantup.com/ubuntu/boxes/groovy64 20.10
# vagrant box add "ubuntu/groovy64" --provider=virtualbox
# vagrant mutate "ubuntu/groovy64" libvirt
# vagrant init --template Vagrantfile.provision.bash.ubuntu.erb
# # must be created in project root directory with Vagrantfile template file
# vagrant up --provider=libvirt "kuma-control-plane" 


# https://github.com/chef/bento/tree/master/packer_templates/ubuntu
# vagrant box add "bento/ubuntu-19.10" --provider=virtualbox
# vagrant mutate "bento/ubuntu-19.10" libvirt
# vagrant init --template Vagrantfile.provision.bash.ubuntu.erb
# # must be created in project root directory with Vagrantfile template file
# vagrant up --provider=libvirt "kuma-control-plane"

# https://github.com/chef/bento/tree/master/packer_templates/ubuntu
# vagrant box add "bento/ubuntu-20.04" --provider=virtualbox
# vagrant mutate "bento/ubuntu-20.04" libvirt
# vagrant init --template Vagrantfile.provision.bash.ubuntu.erb
# # must be created in project root directory with Vagrantfile template file
# vagrant up --provider=libvirt "kuma-control-plane"
# vagrant up --provider=libvirt "redis"

# #https://github.com/chef/bento/tree/master/packer_templates/fedora
# vagrant box add "bento/fedora-32" --provider=virtualbox
# vagrant mutate "bento/fedora-32" libvirt
# vagrant up --provider=libvirt "vg-compute-08"

# # https://app.vagrantup.com/centos/boxes/8 # Ansible provision OK
# vagrant box add "centos/8" --provider=libvirt
# vagrant up --provider=libvirt "vg-compute-09"

# # https://github.com/chef/bento/tree/master/packer_templates/opensuse
# vagrant box add  "bento/opensuse-leap-15.1" --provider=virtualbox
# vagrant mutate "bento/opensuse-leap-15.1"  libvirt
# vagrant up --provider=libvirt "vg-compute-10"

# # https://github.com/chef/bento/tree/master/packer_templates/sles
# vagrant box add  "bento/sles-15-sp1" --provider=virtualbox
# vagrant mutate "bento/sles-15-sp1"  libvirt
# vagrant init --template Vagrantfile.provision.bash.suse.erb
# # must be created in project root directory with Vagrantfile template file
# vagrant up --provider=libvirt "kuma-control-plane"
# vagrant up --provider=libvirt "redis"

# https://app.vagrantup.com/debian/boxes/buster64
# vagrant box add "debian/buster64" --provider=libvirt
# vagrant init --template Vagrantfile.provision.bash.erb
# # must be created in project root directory with Vagrantfile template file
# vagrant up --provider=libvirt "vg-debian-01"

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
