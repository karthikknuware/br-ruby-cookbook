#
# Cookbook Name:: ruby
# Attributes:: default
#

default['ruby'].tap do |ruby|
  ruby['versions'] = %w[]
  ruby['path'] = '/opt/rubies'
  ruby['owner'] = 'root'
  ruby['group'] = 'root'
  ruby['mode'] = '0755'
  ruby['dependencies'] = []
  ruby['gems'] = %w[ bundler ]
  ruby['env'] = {}
end

default['ruby']['ruby-build'].tap do |ruby_build|
  ruby_build['repository'] = 'https://github.com/sstephenson/ruby-build.git'
  ruby_build['revision'] = 'master'
  ruby_build['path'] = '/opt/ruby-build'
  ruby_build['install_command'] = './install.sh'
end
