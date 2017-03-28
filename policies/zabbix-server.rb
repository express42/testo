instance_eval(IO.read("policies/base.rb"))

name 'zabbix-server'

cookbook 'chef_nginx'
cookbook 'php-fpm'
cookbook 'postgresql_lwrp'
cookbook 'zabbix_lwrp', path: '../../zabbix_lwrp_chromko'
cookbook 'zabbix_templates', git: 'git@github.com:express42-cookbooks/zabbix_templates.git'

default['zabbix']['version'] = '3.0'

run_list.concat([
  'chef_nginx::repo',
  'postgresql_lwrp::apt_official_repository',
  'zabbix_lwrp::default',
  'zabbix_lwrp::host',
  'zabbix_lwrp::partition',
  'zabbix_lwrp::database',
  'zabbix_lwrp::server',
  'zabbix_lwrp::web',
  'zabbix_templates::default',
  'zabbix_templates::linux',
  'zabbix_templates::postgresql',
  'zabbix_templates::zabbix-server',
  'zabbix_lwrp::connect'
])
