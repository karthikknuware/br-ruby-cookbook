#
# Cookbook Name:: ruby
# Recipe:: install
#

node['ruby']['installed_versions'].each do |version|
  ruby_version version do
    install_path node['ruby']['install_path']
    global_bin_path node['ruby']['global_bin_path']
    build_env node['ruby']['build_env']
    owner node['ruby']['owner']
    group node['ruby']['group']
    mode node['ruby']['mode']
    globalize node['ruby']['global_version'] == version
    action :install
  end
end
