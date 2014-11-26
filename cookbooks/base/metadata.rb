name             'base'
maintainer       'LLC Express 42'
maintainer_email 'info@express42.com'
license          'MIT'
description      'Installs/Configures base hardening recipes'
version          '0.1.3'

%w( cron lvm nginx aptly ).each do |pkg|
  depends pkg
end

supports         'debian'
supports         'ubuntu'
