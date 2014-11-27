source 'https://supermarket.getchef.com'

group :base do
  cookbook 'apt'
  cookbook 'certificate'
  cookbook 'chef-client'
  cookbook 'chef-server'
  cookbook 'cron'
  cookbook 'helpers-express42', git: 'git@github.com:express42-cookbooks/helpers-express42.git'
  cookbook 'lvm'
  cookbook 'ntp'
  cookbook 'openssh'
  cookbook 'postfix', git: 'git@github.com:express42-cookbooks/postfix.git'
  cookbook 'rsyslog', git: 'git@github.com:express42-cookbooks/rsyslog.git'
  cookbook 'ssh_known_hosts'
  cookbook 'sudo'
  cookbook 'sysctl'
  cookbook 'user'
end

group :graylog do
  cookbook 'elasticsearch'
  cookbook 'graylog2'
  cookbook 'java'
  cookbook 'mongodb'
end

group :zabbix do
  cookbook 'postgresql_lwrp', git: 'git@github.com:express42-cookbooks/postgresql.git'
  cookbook 'nginx', git: 'git@github.com:evilmartians/chef-nginx'
  cookbook 'php', git: 'git@github.com:express42-cookbooks/php.git'
  cookbook 'zabbix', git: 'git@github.com:express42-cookbooks/zabbix.git'
  cookbook 'zabbix-server', git: 'git@github.com:express42-cookbooks/zabbix-server.git', branch: 'new_era'
end

group :ruby do
  cookbook 'ruby', git: 'git@github.com:express42-cookbooks/ruby.git'
  cookbook 'runit'
end

group :services do
  cookbook 'aptly', git: 'git@github.com:express42-cookbooks/chef-aptly'
  cookbook 'cobbler', git: 'git@github.com:express42-cookbooks/cobbler.git'
  cookbook 'keepalived', git: 'git@github.com:express42-cookbooks/keepalived.git'
  cookbook 'openvpn', git: 'git@github.com:express42-cookbooks/openvpn.git'
end
