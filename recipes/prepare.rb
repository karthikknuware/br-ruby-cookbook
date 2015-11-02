#
# Cookbook Name:: ruby
# Recipe:: prepare
#

node['ruby']['dependencies'].each do |name|
  package name do
    action :install
  end
end

execute 'install ruby-build' do
  command node['ruby']['ruby-build']['install_command']
  cwd node['ruby']['ruby-build']['install_path']
  action :nothing
end

package 'git'

git node['ruby']['ruby-build']['install_path'] do
  repository node['ruby']['ruby-build']['repository']
  revision node['ruby']['ruby-build']['revision']
  action :sync
  notifies :run, 'execute[install ruby-build]', :immediately
end
