default['base']['packages'] = %w(nscd screen vim curl sysstat gdb dstat tcpdump strace iozone3 htop tmux byobu mailutils ncdu mosh iotop atop zsh mutt)
default['base']['extra-packages'] = []

default['base']['private_networks'] = '192.168.0.0/16,172.16.0.0/12,10.0.0.0/8'

default['base']['handler']['mail_from'] = 'chef@express42.com'
default['base']['handler']['mail_to'] = []
