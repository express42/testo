# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu12.04-chef11-parallels"

  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "inventory.ini"
    ansible.playbook = "playbook.yml"
  end
end
