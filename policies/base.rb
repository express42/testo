name 'base'

default_source :supermarket

cookbook 'apt'
cookbook 'bsw_gpg'
cookbook 'certificate'
cookbook 'chef-client'
cookbook 'chef-vault'
cookbook 'cron'
cookbook 'helpers_express42', git: 'git@github.com:express42-cookbooks/helpers_express42.git'
cookbook 'locale'
cookbook 'lvm'
cookbook 'ntp'
cookbook 'openssh'
cookbook 'os-hardening'
cookbook 'postfix', git: 'git@github.com:express42-cookbooks/postfix.git'
cookbook 'resolver'
cookbook 'rsyslog', git: 'git@github.com:express42-cookbooks/rsyslog.git'
cookbook 'ssh_known_hosts'
cookbook 'sudo'
cookbook 'sysctl'
cookbook 'timezone-ii', git: 'git@github.com:L2G/timezone-ii.git'
cookbook 'user'

default['authorization']['sudo']['include_sudoers_d'] = true
default['authorization']['sudo']['passwordless'] = true
default['authorization']['sudo']['users'] = ['vagrant']

default['postfix']['options']['mydomain'] = 'vagrant'

default['chef_client']['config']['client_fork'] = true
default['chef_client']['interval'] = '300'
default['chef_client']['log_file'] = 'client.log'
default['chef_client']['logrotate']['frequency'] = 'daily'
default['chef_client']['logrotate']['rotate'] = '7'
default['chef_client']['splay'] = '10'

default['openssh']['server']['allow_agent_forwarding'] = 'yes'
default['openssh']['server']['password_authentication'] = 'yes'
default['openssh']['server']['permit_root_login'] = 'yes'
default['openssh']['server']['subsystem'] = 'sftp /usr/lib/openssh/sftp-server'
default['openssh']['server']['use_dns'] = 'no'

run_list [
  'apt',
  'chef-client::config',
  'chef-client::init_service',
  'chef-client::delete_validation',
  'helpers_express42::mail',
  'helpers_express42::network',
  'helpers_express42::packages',
  'locale',
  'lvm',
  'ntp',
  'openssh',
  'postfix::default_server',
  'rsyslog',
  'ssh_known_hosts',
  'sudo',
  'sysctl',
  'timezone-ii',
  'user::data_bag',
]
