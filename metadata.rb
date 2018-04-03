name             'redis-simple'
maintainer       'Andrei Skopenko'
maintainer_email 'andrey@skopenko.net'
license          'Apache-2.0'
description      'Installs/Configures Redis daemon'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/scopenco/chef-redis'
issues_url 'https://github.com/scopenco/chef-redis/issues'
version '0.1.1'

supports 'amazon'
supports 'redhat'
supports 'centos'
supports 'scientific'
supports 'fedora'
supports 'debian'
supports 'ubuntu'

depends 'yum-epel'

recipe 'redis-simple::default', 'Install and configure Redis daemon'
