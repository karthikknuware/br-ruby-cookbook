#
# Cookbook Name:: br-ruby
# Recipe:: install
#

node['ruby']['versions'].each do |version|
  ruby_version version do
    path node['ruby']['path']
    env node['ruby']['env']
    owner node['ruby']['owner']
    group node['ruby']['group']
    mode node['ruby']['mode']
    action :install
  end
end
