#
# Cookbook Name:: ruby
# Recipe:: install
#

node['ruby']['installed_versions'].each do |version|
  ruby_version version do
    install_path node['ruby']['install_path']
    bin_path node['ruby']['bin_path']
    owner node['ruby']['owner']
    group node['ruby']['group']
    mode node['ruby']['mode']
    globalize node['ruby']['global_version'] == version
    action :install
  end
end
