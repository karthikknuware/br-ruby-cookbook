#
# Cookbook Name:: br-ruby
# Recipe:: install
#

node['ruby']['versions'].each do |version|
  ruby_version version do
    install_path node['ruby']['install_path']
    env node['ruby']['env']
    gems node['ruby']['gems']
    owner node['ruby']['owner']
    group node['ruby']['group']
    mode node['ruby']['mode']
    action :install
  end
end
