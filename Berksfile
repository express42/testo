source 'https://supermarket.getchef.com'

group :base do
  cookbook 'apt'
  cookbook 'certificate'
  cookbook 'chef-client'
  cookbook 'cron'
  cookbook 'helpers-express42', git: 'git@github.com:express42-cookbooks/helpers-express42.git'
  cookbook 'lvm'
  cookbook 'ntp'
  cookbook 'openssh'
  cookbook 'os-hardening'
  cookbook 'postfix', git: 'git@github.com:express42-cookbooks/postfix.git'
  cookbook 'rsyslog', git: 'git@github.com:express42-cookbooks/rsyslog.git'
  cookbook 'ssh_known_hosts'
  cookbook 'sudo'
  cookbook 'sysctl'
  cookbook 'timezone-ii'
  cookbook 'user'
end

group :databases do
  cookbook 'mongodb'
  cookbook 'postgresql_lwrp', git: 'git@github.com:express42-cookbooks/postgresql.git'
  cookbook 'redis', git: 'git@github.com:express42-cookbooks/redis.git'
end

group :development do
  cookbook 'java'
  cookbook 'jenkins'
  cookbook 'php', git: 'git@github.com:express42-cookbooks/php.git'
  cookbook 'ruby', git: 'git@github.com:express42-cookbooks/ruby.git'
  cookbook 'runit'
end

group :graylog2 do
  cookbook 'elasticsearch'
  cookbook 'graylog2'
  cookbook 'java'
  cookbook 'mongodb'
end

group :services do
  cookbook 'aptly', git: 'git@github.com:express42-cookbooks/chef-aptly'
  cookbook 'chef-server'
  cookbook 'cobbler', git: 'git@github.com:express42-cookbooks/cobbler.git'
  cookbook 'keepalived', git: 'git@github.com:express42-cookbooks/keepalived.git'
  cookbook 'memcached', git: 'git@github.com:express42-cookbooks/memcached.git'
  cookbook 'nfs'
  cookbook 'nginx', git: 'git@github.com:evilmartians/chef-nginx', tag: 'v2.2.3'
  cookbook 'openvpn', git: 'git@github.com:express42-cookbooks/openvpn.git'
  cookbook 's3backup', git: 'git@github.com:express42-cookbooks/s3backup.git'
end

group :zabbix do
  cookbook 'nginx', git: 'git@github.com:evilmartians/chef-nginx', tag: 'v2.2.3'
  cookbook 'php', git: 'git@github.com:express42-cookbooks/php.git'
  cookbook 'postgresql_lwrp', git: 'git@github.com:express42-cookbooks/postgresql.git'
  cookbook 'zabbix', git: 'git@github.com:express42-cookbooks/zabbix.git'
  cookbook 'zabbix-server', git: 'git@github.com:express42-cookbooks/zabbix-server.git', branch: 'new_era'
end
