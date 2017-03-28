name "all"

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
cookbook 'redis', git: 'git@github.com:express42-cookbooks/redis.git'
cookbook 'git'
cookbook 'golang'
cookbook 'java'
cookbook 'nodejs'
cookbook 'pm2'
cookbook 'ruby_lwrp'
cookbook 'runit'
cookbook 'keepalived', git: 'git@github.com:express42-cookbooks/keepalived.git'
cookbook 'memcached', git: 'git@github.com:express42-cookbooks/memcached.git'
cookbook 'nfs'
cookbook 'rabbitmq'
cookbook 's3_file'

default['java']['version'] = '8'

run_list [
  'apt',
  'bsw_gpg',
  'certificate',
  'chef-client',
  'chef-vault',
  'cron',
  'helpers_express42',
  'locale',
  'lvm',
  'ntp',
  'openssh',
  'os-hardening',
  'postfix',
  'resolver',
  'rsyslog',
  'ssh_known_hosts',
  'sudo',
  'sysctl',
  'timezone-ii',
  'user',
  'redis',
  'git',
  'golang',
  'java',
  'nodejs',
  'pm2',
  'ruby_lwrp',
  'runit',
  'keepalived',
  'memcached',
  'nfs',
  'rabbitmq',
  's3_file'
]
