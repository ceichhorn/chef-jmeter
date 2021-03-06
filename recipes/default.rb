#
# Cookbook: jmeter
# License: Apache 2.0
#
# Copyright (C) 2015 Gannett Co.
#

include_recipe 'java::default'

directory node['jmeter']['plan_dir'] do
  recursive true
  not_if { Dir.exist?(path) }
end

ark 'jmeter' do
  action :install
  has_binaries ['bin/jmeter', 'bin/jmeter-server', 'bin/ApacheJMeter.jar']
  url node['jmeter']['source_url']
  checksum node['jmeter']['source_checksum']
  version node['jmeter']['version']
  only_if { node['jmeter']['install_type'] == 'source' }
end
