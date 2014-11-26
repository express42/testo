# Description

Installs/Configures base hardening recipes

# Requirements

## Platform:

* Debian
* Ubuntu

## Cookbooks:

* cron
* lvm
* nginx
* aptly

# Attributes

* `node['aptly']['lvm_group']` -  Defaults to `"shared"`.
* `node['aptly']['volume_size']` -  Defaults to `"150G"`.
* `node['aptly']['retention_count']` -  Defaults to `"6"`.
* `node['aptly']['create_partition']` -  Defaults to `"true"`.
* `node['aptly']['listen_address']` -  Defaults to `"0.0.0.0"`.
* `node['aptly']['server_name']` -  Defaults to `"localhost"`.
* `node['base']['packages']` -  Defaults to `"%w(nscd screen vim curl sysstat gdb dstat tcpdump strace iozone3 htop tmux byobu mailutils ncdu mosh iotop atop zsh mutt)"`.
* `node['base']['extra-packages']` -  Defaults to `"[ ... ]"`.
* `node['base']['private_networks']` -  Defaults to `"192.168.0.0/16,172.16.0.0/12,10.0.0.0/8"`.
* `node['base']['handler']['mail_from']` -  Defaults to `"chef@express42.com"`.
* `node['base']['handler']['mail_to']` -  Defaults to `"[ ... ]"`.

# Recipes

* base::aptly
* base::default

# License and Maintainer

Maintainer:: LLC Express 42 (<info@express42.com>)

License:: MIT
