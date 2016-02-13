#
# Cookbook Name:: br-ruby
# Recipe:: prepare
#

node['ruby']['dependencies'].each do |name|
  package name do
    action :install
  end
end

execute 'install ruby-build' do
  command './install.sh'
  cwd node['ruby']['ruby-build']['path']
  action :nothing
end

package 'git'

git node['ruby']['ruby-build']['path'] do
  repository node['ruby']['ruby-build']['repository']
  revision node['ruby']['ruby-build']['revision']
  action :sync
  notifies :run, 'execute[install ruby-build]', :immediately
end
