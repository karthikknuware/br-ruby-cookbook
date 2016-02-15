#
# Cookbook Name:: br-ruby
# Attributes:: default
#

default['ruby'].tap do |ruby|
  ruby['versions'] = []
  ruby['install_path'] = '/opt/rubies'
  ruby['owner'] = 'root'
  ruby['group'] = 'root'
  ruby['mode'] = '0755'
  ruby['dependencies'] = []
  ruby['gems'] = { 'bundler' => '>= 0' }
  ruby['env'] = {}
end

default['ruby']['ruby-build'].tap do |ruby_build|
  ruby_build['repository'] = 'https://github.com/sstephenson/ruby-build.git'
  ruby_build['revision'] = 'master'
  ruby_build['install_path'] = '/opt/ruby-build'
end
