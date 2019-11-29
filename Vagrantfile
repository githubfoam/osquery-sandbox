# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# https://computingforgeeks.com/setup-etcd-cluster-on-centos-debian-ubuntu/
# $centos_docker_script = <<SCRIPT
# # Install Docker
# sudo yum remove docker \
#           docker-client \
#           docker-client-latest \
#           docker-common \
#           docker-latest \
#           docker-latest-logrotate \
#           docker-logrotate \
#           docker-engine
# sudo yum install -y yum-utils \
#             device-mapper-persistent-data \
#             lvm2
# sudo yum-config-manager \
#                 --add-repo \
#                 https://download.docker.com/linux/centos/docker-ce.repo
# sudo yum install -y docker-ce \
#               docker-ce-cli \
#               containerd.io
# sudo systemctl start docker && sudo docker --version
# # Install Terraform
# sudo yum install unzip -y
# wget -q -nc https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip
# unzip terraform_0.12.6_linux_amd64.zip
# sudo mv terraform /usr/local/bin/
# terraform version
# SCRIPT
# $ubuntu_docker_script = <<SCRIPT
# # Get Docker Engine - Community for Ubuntu
# # https://docs.docker.com/install/linux/docker-ce/ubuntu/
# sudo apt-get remove docker docker-engine docker.io containerd runc
# sudo apt-get update
# sudo apt-get install \
# apt-transport-https \
# ca-certificates \
# curl \
# software-properties-common -y
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository \
# "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
# $(lsb_release -cs) \
# stable"
# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# sudo docker --version
# # Manage Docker as a non-root user
# # https://docs.docker.com/install/linux/linux-postinstall/
# sudo groupadd docker && sudo usermod -aG docker vagrant # add user to the docker group
# sudo systemctl enable docker
# docker --version
# # Install Terraform
# sudo apt-get install unzip -y
# wget -q -nc https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip
# unzip terraform_0.12.6_linux_amd64.zip
# sudo mv terraform /usr/local/bin/
# terraform version
# SCRIPT
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
# YAML module for reading box configurations.
require 'yaml'
#  server configs from YAML/YML file
servers_list = YAML.load_file(File.join(File.dirname(__FILE__), 'provisioning/servers_list.yml'))

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 # Disable updates
 config.vm.box_check_update = false

      servers_list.each do |server|
        config.vm.define server["vagrant_box_host"] do |box|
          box.vm.box = server["vagrant_box"]
          box.vm.hostname = server["vagrant_box_host"]
          box.vm.network server["network_type"], ip: server["vagrant_box_ip"]
          box.vm.network "forwarded_port", guest: server["guest_port"], host: server["host_port"]
          box.vm.provider "virtualbox" do |vb|
              vb.name = server["vbox_name"]
              vb.memory = server["vbox_ram"]
              vb.cpus = server["vbox_cpu"]
              vb.gui = false
              vb.customize ["modifyvm", :id, "--groups", "/zeek-sandbox"] # create vbox group
          end # end of box.vm.providers

          box.vm.provision "ansible_local" do |ansible|
              # ansible.compatibility_mode = "2.0"
              ansible.compatibility_mode = server["ansible_compatibility_mode"]
              ansible.version = server["ansible_version"]
              ansible.playbook = server["server_bootstrap"]
              # ansible.inventory_path = 'provisioning/hosts'
              # ansible.verbose = "vvvv" # debug
           end # end if box.vm.provision
          # box.vm.provision "shell", inline: $ubuntu_docker_script, privileged: false
          # box.vm.provision "shell", inline: server["ubuntu_docker_script"], privileged: false
          box.vm.provision "shell", inline: <<-SHELL
          echo "======================================================================================="
          hostnamectl status
          echo "======================================================================================="
          SHELL

        end # end of config.vm
      end  # end of servers_list.each loop
end # end of Vagrant.configure
