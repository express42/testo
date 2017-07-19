instance_eval(IO.read('policies/base.rb'))

name 'chef-server'

cookbook 'chef_handler'
cookbook 'chef-ingredient'
cookbook 'chef-dk'
cookbook 'chef-server'
cookbook 'chef-server-ctl', git: 'git@github.com:stephenlauck/chef-server-ctl.git'
cookbook 'chef-sugar'
cookbook 'chef-zero'

default['chef-server']['addons'] = []
default['chef-server']['accept_license'] = true

run_list.concat([
                  'chef-server',
                  'chef-server::addons',
                ])
