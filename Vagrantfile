# -*- mode: ruby -*-
# vi: set ft=ruby :

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

          if Vagrant::Util::Platform.freebsd?
              # box.vm.provision "shell", path: server["shell_provision"]
              box.vm.provision "shell", path: "provisioning/bootstrap_freebsd.sh"
              puts "Vagrant launched from FreeBSD."
          end
          box.vm.provision "shell", path: "provisioning/bootstrap.sh"
          # box.vm.provision "shell", path: server["shell_provision"]
          box.vm.provision "ansible_local" do |ansible|
              # ansible.compatibility_mode = "2.0"
              ansible.compatibility_mode = server["ansible_compatibility_mode"]
              # ansible.version = server["ansible_version"]
              ansible.playbook = server["server_bootstrap"]
              # ansible.inventory_path = 'provisioning/hosts'
              # ansible.verbose = "vvvv" # debug
           end # end if box.vm.provision
          # box.vm.provision "shell", inline: $ubuntu_docker_script, privileged: false
          # box.vm.provision "shell", inline: <<-SHELL
          # echo "======================================================================================="
          # hostnamectl status
          # echo "======================================================================================="
          # SHELL

        end # end of config.vm
      end  # end of servers_list.each loop
end # end of Vagrant.configure
