# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.berkshelf.enable = true

  config.vm.define :testo do |main|
    main.vm.box = 'express42/ubuntu-14.04'
    main.vm.hostname = 'testo'
    # config.vm.network :forwarded_port, guest: 80, host: 8880
    main.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', '1024']
    end

#    main.chef_zero.chef_repo_path = '.'

    main.vm.provision :chef_solo do |chef|
      chef.environment = 'vagrant'
      chef.log_level = :info

      chef.roles_path = 'roles'
      chef.data_bags_path = 'data_bags'
      chef.environments_path = 'environments'
      # Here the path to secret file on local filesystem
      # chef.encrypted_data_bag_secret_key_path = './.chef/encrypted_data_bag_secret'

      chef.run_list = [
        'role[base]'
      ]
    end
  end
end
