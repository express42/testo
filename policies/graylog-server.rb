instance_eval(IO.read("policies/base.rb"))

name 'graylog-server'

default_source :supermarket

cookbook 'authbind'
cookbook 'elasticsearch', '~> 2'
cookbook 'graylog2'
cookbook 'java'
cookbook 'sc-mongodb', git: 'git@github.com:chef-brigade/mongodb-cookbook.git'

default['elasticsearch']['version'] = "2.3.5"
default['graylog2']['password_secret'] = 'NP8GePxntdVuQ5L3rK80fOR9mVU0gmopqMpmZdR58m7IZVo9hL4nIgGdG1L1Zh3O6jM0Delnso8EibLdhZ3F2lLXeklHdeib'
default['graylog2']['root_timezone'] = 'UTC'
default['graylog2']['root_password_sha2'] = '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'
default['graylog2']['rest']['admin_access_token'] = 'NlXQ1B375BQPdocO1hzoVTKowWjAsgGzIoHfm3zMR0lHU24341XszauM52L5EZu0shR6CMJtM9cwdpxKMhGGDoybtcRtiQif'
default['graylog2']['server']['java_opts'] = '-Djava.net.preferIPv4Stack=true -Xms512m -Xmx512m -XX:NewRatio=1 -XX:PermSize=128m -XX:MaxPermSize=256m -server -XX:+ResizeTLAB -XX:+UseConcMarkSweepGC -XX:+CMSConcurrentMTEnabled -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -XX:-OmitStackTraceInFastThrow'
default['graylog2']['server']['install_tzdata_java'] = false
default['graylog2']['elasticsearch']['cluster_name'] = 'elasticsearch'
default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

run_list.concat([
  'authbind',
  'java',
  'elasticsearch',
  'sc-mongodb',
  'graylog2',
  'graylog2::server',
  'graylog2::authbind'
])
