#
# Cookbook Name:: ruby
# Attributes:: default
#

default['ruby'].tap do |ruby|
  ruby['global_version'] = '2.2.1'
  ruby['global_bin_path'] = '/usr/local/bin'
  ruby['installed_versions'] = %w[ 2.2.1 2.2.2 ]
  ruby['install_path'] = '/opt/rubies'
  ruby['owner'] = 'root'
  ruby['group'] = 'root'
  ruby['mode'] = '0755'
  ruby['dependencies'] = []
  ruby['gems'] = %w[ bundler ]
end

default['ruby']['ruby-build'].tap do |ruby_build|
  ruby_build['repository'] = 'https://github.com/sstephenson/ruby-build.git'
  ruby_build['revision'] = 'master'
  ruby_build['install_path'] = '/opt/ruby-build'
  ruby_build['install_command'] = './install.sh'
  ruby_build['build_env'] = {}
end
