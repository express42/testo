# instance_eval(IO.read("policies/base.rb"))

name 'zabbix_agent_win'

default_source :supermarket

cookbook 'zabbix_lwrp', path: '../../zabbix_lwrp_chromko'
cookbook 'windows'

default['zabbix']['agent']['windows']['version'] = '3.0.4'
default['zabbix']['agent']['windows']['installer'] = 'chocolatey'

run_list [
  'zabbix_lwrp::agent_win',
]
