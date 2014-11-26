serial = Time.new.strftime('%Y%m%d%H%M')
repo_components_list = node['aptly']['repo_components'].*' '
distname = node['lsb']['codename']
retention_count = node['aptly']['retention_count']
aptly_dir = node['aptly']['rootdir']

# Create mirrors
aptly_mirror "#{distname}-system" do
  action :create
  distribution distname
  component repo_components_list
  keyid '437D05B5'
  keyserver 'keys.gnupg.net'
  uri 'http://mirror.yandex.ru/ubuntu/'
end

aptly_mirror "#{distname}-security" do
  action :create
  distribution "#{distname}-security"
  component repo_components_list
  uri 'http://security.ubuntu.com/ubuntu'
end

# Snapshots
# Stale base snapshot
aptly_snapshot 'stale-system-snapshot' do
  action :create
  from "#{distname}-system"
  type 'mirror'
  empty false
end

# Always updated staging snapshot
aptly_snapshot "updated-system-snapshot-#{serial}" do
  action :create
  from "#{distname}-system"
  type 'mirror'
  empty false
end

# Always updated security snapshot
aptly_snapshot "security-snapshot-#{serial}" do
  action :create
  from "#{distname}-security"
  type 'mirror'
  empty false
end

# Endpoint production snapshot
aptly_snapshot "production-#{serial}" do
  action :merge
  merge_source1 'stale-system-snapshot'
  merge_source2 "security-snapshot-#{serial}"
end

# Endpoing staging snapshot
aptly_snapshot "staging-#{serial}" do
  action :merge
  merge_source1 "updated-system-snapshot-#{serial}"
  merge_source2 "security-snapshot-#{serial}"
end

# Publication
# Publish endpoint production repo
aptly_publish "production-#{serial}" do
  action :create
  type 'snapshot'
  prefix 'ubuntu'
  distribution 'production'
end

# Publish endpoint staging repo
aptly_publish "staging-#{serial}" do
  action :create
  type 'snapshot'
  prefix 'ubuntu'
  distribution 'staging'
end

# Switches for newest snapshots
# Switch for production repo
aptly_publish "production-switch-#{serial}" do
  action :switch
  type 'snapshot'
  prefix 'ubuntu'
  distribution 'production'
  switch_source "production-#{serial}"
end

# Switch for staging repo
aptly_publish "staging-switch-#{serial}" do
  action :switch
  type 'snapshot'
  prefix 'ubuntu'
  distribution 'staging'
  switch_source "staging-#{serial}"
end

# Clear old  snapshots
%w( staging production security-snapshot updated-system ).each do |snap|
  ruby_block 'Clear old snapshots' do
    block do
      snapshots = `aptly snapshot -raw list | grep #{snap}`.split("\n")
      if snapshots.length > retention_count
        to_delete = snapshots.first snapshots.size - retention_count
        to_delete.each do |del|
          unless system("aptly snapshot drop #{del}")
            fail 'Something go wrong in snapshots retention'
          end
        end
      end
    end
  end
end

# Update mirrors
cron_d 'main-repo-update' do
  minute 0
  hour 2
  command "aptly mirror update #{distname}-system"
  user    'aptly'
end

cron_d 'security-repo-update' do
  minute '*/5'
  command "aptly mirror update #{distname}-security"
  user 'aptly'
end

# Partition for repo
lvm_logical_volume 'aptly' do
  group       node['aptly']['lvm_group']
  size        node['aptly']['volume_size']
  filesystem  'ext4'
  mount_point aptly_dir
end

# Nginx conf
nginx_site 'aptly' do
  template 'aptly/aptly.conf.erb'
  variables(
    listen_ip: node['aptly']['listen_address'],
    server_name: node['aptly']['server_name']
  )
end
