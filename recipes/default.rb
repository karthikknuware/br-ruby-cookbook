#
# Cookbook Name:: ruby
# Recipe:: default
#

ruby_install node['ruby']['version'] do
  packages node['ruby']['packages']
  path node['ruby']['path']
  user node['ruby']['install']['user']
  group node['ruby']['install']['group']
  force node['ruby']['install']['force']
  environment node['ruby']['install']['environment']
  strategy node['ruby']['install']['strategy']
  config node['ruby']['install'][node['ruby']['install']['strategy'].to_s]
  before node['ruby']['install']['before']
  after node['ruby']['install']['after']
end
