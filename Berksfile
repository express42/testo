source 'https://supermarket.chef.io'

group :base do
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
end

group :chef do
  cookbook 'chef_handler'
  cookbook 'chef-ingredient'
  cookbook 'chef-dk'
  cookbook 'chef-server'
  cookbook 'chef-server-ctl', git: 'git@github.com:stephenlauck/chef-server-ctl.git'
  cookbook 'chef-sugar'
  cookbook 'chef-zero'
end

group :databases do
  cookbook 'mongodb', git: 'git@github.com:chef-brigade/mongodb-cookbook.git'
  cookbook 'postgresql_lwrp'
  cookbook 'redis', git: 'git@github.com:express42-cookbooks/redis.git'
end

group :development do
  cookbook 'build-essential'
  cookbook 'git'
  cookbook 'golang'
  cookbook 'java'
  cookbook 'jenkins'
  cookbook 'nodejs'
  cookbook 'pm2'
  cookbook 'php-fpm'
  cookbook 'ruby_lwrp'
  cookbook 'runit'
end

group :graylog2 do
  cookbook 'authbind'
  cookbook 'elasticsearch', '= 0.3.14'
  cookbook 'graylog2', '< 2.0'
  cookbook 'java'
  cookbook 'mongodb', git: 'git@github.com:chef-brigade/mongodb-cookbook.git'
end

group :services do
  cookbook 'cobbler', git: 'git@github.com:express42-cookbooks/cobbler.git'
  cookbook 'keepalived', git: 'git@github.com:express42-cookbooks/keepalived.git'
  cookbook 'memcached', git: 'git@github.com:express42-cookbooks/memcached.git'
  cookbook 'nfs'
  cookbook 'nginx', git: 'git@github.com:evilmartians/chef-nginx'
  cookbook 'openvpn', git: 'git@github.com:express42-cookbooks/openvpn.git'
  cookbook 'rabbitmq'
  cookbook 's3_file'
end

group :zabbix do
  cookbook 'nginx', git: 'git@github.com:evilmartians/chef-nginx'
  cookbook 'php-fpm'
  cookbook 'postgresql_lwrp'
  cookbook 'zabbix_lwrp'
  cookbook 'zabbix_templates', git: 'git@github.com:express42-cookbooks/zabbix_templates.git'
end
